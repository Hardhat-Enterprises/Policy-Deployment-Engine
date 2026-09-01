/**
 * Production registration flow — opens portal in browser and receives credentials
 * via a localhost callback (no manual paste). Falls back to terminal paste if needed.
 */

import { exec } from "node:child_process";
import readline from "node:readline";
import { promisify } from "node:util";
import { isLocalCallbackUrl, startCallbackServer } from "./callback-server.js";
import { saveStoredCredentials } from "./credentials.js";
import { portalRegisterUrl, resolveEndpoints } from "./gate-config.js";
import { assertPortalReachable } from "./portal-client.js";

const execAsync = promisify(exec);

function ask(rl: readline.Interface, question: string): Promise<string> {
    return new Promise((resolve) => {
        rl.question(question, (answer) => resolve(answer.trim()));
    });
}

async function openBrowser(url: string): Promise<void> {
    const platform = process.platform;
    const cmd =
        platform === "darwin"
            ? `open "${url}"`
            : platform === "win32"
              ? `start "" "${url}"`
              : `xdg-open "${url}"`;
    try {
        await execAsync(cmd);
    } catch {
        console.log(`Open this URL in your browser:\n  ${url}\n`);
    }
}

async function promptForCredentials(): Promise<{ org_id: string; token: string }> {
    const rl = readline.createInterface({ input: process.stdin, output: process.stdout });
    try {
        console.log("Paste the credentials shown on the portal success page.");
        console.log("");

        const orgId = await ask(rl, "org_id: ");
        if (!orgId) {
            throw new Error("org_id is required");
        }

        const token = await ask(rl, "API token (PDE_ORG_TOKEN): ");
        if (!token) {
            throw new Error("API token is required");
        }

        return { org_id: orgId, token };
    } finally {
        rl.close();
    }
}

function printRegistrationSuccess(
    orgId: string,
    credentialsPath: string,
    endpoints: ReturnType<typeof resolveEndpoints>
): void {
    console.log("");
    console.log("----------------------------------------");
    console.log("Registration saved locally.");
    console.log(`  org_id:  ${orgId}`);
    console.log(`  file:    ${credentialsPath}`);
    console.log(`  portal:  ${endpoints.portalUrl}`);
    console.log(`  api:     ${endpoints.apiUrl}`);
    console.log("----------------------------------------");
    console.log("");
    console.log("Verify connection:");
    console.log("  pde-gate status");
    console.log("");
    console.log("CI usage (token only — config fetched from API each run):");
    console.log(`  PDE_ORG_TOKEN=*** PDE_ORG_ID=${orgId} pde-gate check --plan plan.json --policies policies/`);
    console.log("");
    console.log("Local usage:");
    console.log("  pde-gate check --plan plan.json --policies policies/");
    console.log("");
}

/**
 * Portal registration — opens browser, saves org_id + token locally.
 * Org settings (regions, enabled_policies) live in the portal DB, not pasted here.
 */
export async function runPortalRegistration(): Promise<void> {
    const endpoints = resolveEndpoints();
    await assertPortalReachable(endpoints);

    const callbackServer = await startCallbackServer();
    const callbackParam = encodeURIComponent(callbackServer.callbackUrl);
    const registerUrl = `${portalRegisterUrl(endpoints)}?callback=${callbackParam}`;

    if (!isLocalCallbackUrl(callbackServer.callbackUrl)) {
        await callbackServer.close();
        throw new Error("Internal error: callback URL must be localhost");
    }

    console.log("");
    console.log("========================================");
    console.log("  PDE Gate — Portal Registration");
    console.log("========================================");
    console.log("");
    console.log("Opening the portal to register your organisation.");
    console.log(`  ${registerUrl}`);
    console.log("Configure regions and policies on the website — not in this terminal.");
    console.log("Waiting for browser callback on localhost…");
    console.log("");

    await openBrowser(registerUrl);

    let credentials: { org_id: string; token: string };
    try {
        credentials = await callbackServer.waitForCredentials();
        console.log("Received credentials from portal.");
    } catch (err) {
        console.log(
            err instanceof Error ? err.message : "Callback failed — switch to manual entry."
        );
        credentials = await promptForCredentials();
    } finally {
        await callbackServer.close();
    }

    const credentialsPath = saveStoredCredentials(
        { org_id: credentials.org_id, token: credentials.token },
        endpoints
    );

    printRegistrationSuccess(credentials.org_id, credentialsPath, endpoints);
}
