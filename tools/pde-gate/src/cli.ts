import fs from "node:fs";
import * as api from "./api-client.js";
import { loadCredentials, resolveAuth, saveCredentials } from "./credentials.js";

// Global fetch needs Node 18+ (we require 20+ / .nvmrc 24).
if (typeof fetch !== "function") {
  console.error(
    `Node ${process.version} has no global fetch. Use Node 20+ (in this folder: nvm use)`
  );
  process.exit(1);
}

function usage(): never {
  console.log(`pde-gate — PDE policy gate (GCP MVP)

Client keeps Terraform plan locally. Rego + OPA run on the hosted API.

Usage:
  pde-gate register --name <org> --email <email> [--password <pass>]
  pde-gate login --email <email> [--password <pass>]
  pde-gate status
  pde-gate package list
  pde-gate package create --name <name> [--regions r1,r2] [--zones z1,z2] [--file package.json]
  pde-gate package set-regions <package_id> --regions r1,r2 [--zones z1,z2]
  pde-gate package show <package_id>
  pde-gate package delete <package_id>
  pde-gate check --plan <plan.json> --package <package_id> [--platform gcp] [--no-strict-versions]

Env:
  PDE_API_URL   default http://127.0.0.1:3847
  PDE_ORG_ID / PDE_API_KEY   (or ~/.pde-gate/credentials.json)
`);
  process.exit(2);
}

function flag(args: string[], name: string): string | undefined {
  const i = args.indexOf(name);
  if (i >= 0 && args[i + 1] && !args[i + 1]!.startsWith("--")) return args[i + 1];
  return undefined;
}

function has(args: string[], name: string): boolean {
  return args.includes(name);
}

function csv(value: string | undefined): string[] | undefined {
  if (!value?.trim()) return undefined;
  return value
    .split(",")
    .map((s) => s.trim())
    .filter(Boolean);
}

async function main() {
  const args = process.argv.slice(2);
  const cmd = args[0];
  if (!cmd || cmd === "-h" || cmd === "--help") usage();

  const apiUrl = process.env.PDE_API_URL || loadCredentials()?.api_url || "http://127.0.0.1:3847";

  if (cmd === "register") {
    const name = flag(args, "--name");
    const email = flag(args, "--email");
    const password = flag(args, "--password");
    if (!name || !email) {
      console.error("register requires --name and --email");
      process.exit(1);
    }
    const res = await api.registerOrg(apiUrl, { org_name: name, contact_email: email, password });
    saveCredentials({ org_id: res.org_id, api_key: res.api_key, api_url: apiUrl });
    console.log(`PDE_GATE_REGISTERED org_id=${res.org_id}`);
    console.log(`Saved credentials. Export PDE_API_KEY for CI (shown once):`);
    console.log(res.api_key);
    return;
  }

  if (cmd === "login") {
    const email = flag(args, "--email");
    const password = flag(args, "--password");
    if (!email) {
      console.error("login requires --email");
      process.exit(1);
    }
    const res = await api.loginOrg(apiUrl, { email, password });
    saveCredentials({ org_id: res.org_id, api_key: res.api_key, api_url: apiUrl });
    console.log(`PDE_GATE_LOGIN ok org_id=${res.org_id}`);
    console.log(`Saved credentials. Recovered PDE_API_KEY:`);
    console.log(res.api_key);
    return;
  }

  if (cmd === "status") {
    const auth = resolveAuth();
    const org = await api.getOrg(auth.api_url, auth.org_id, auth.api_key);
    console.log(`PDE_GATE_STATUS ok org_id=${org.org_id} name=${org.org_name} api=${auth.api_url}`);
    return;
  }

  if (cmd === "package") {
    const sub = args[1];
    const auth = resolveAuth();
    if (sub === "list") {
      const pkgs = await api.listPackages(auth.api_url, auth.org_id, auth.api_key);
      console.log(JSON.stringify(pkgs, null, 2));
      return;
    }
    if (sub === "show") {
      const id = args[2];
      if (!id) usage();
      const pkg = await api.getPackage(auth.api_url, auth.org_id, auth.api_key, id);
      console.log(JSON.stringify(pkg, null, 2));
      return;
    }
    if (sub === "delete") {
      const id = args[2];
      if (!id) usage();
      await api.deletePackage(auth.api_url, auth.org_id, auth.api_key, id);
      console.log(`PDE_GATE_PACKAGE_DELETED ${id}`);
      return;
    }
    if (sub === "set-regions") {
      const id = args[2];
      const regions = csv(flag(args, "--regions"));
      const zones = csv(flag(args, "--zones"));
      if (!id || !regions?.length) {
        console.error("package set-regions <package_id> --regions r1,r2 [--zones z1,z2]");
        process.exit(1);
      }
      const existing = await api.getPackage(auth.api_url, auth.org_id, auth.api_key, id);
      const variables = {
        ...(existing.variables ?? {}),
        approved_regions: regions,
        ...(zones ? { approved_zones: zones } : {}),
      };
      const pkg = await api.updatePackage(auth.api_url, auth.org_id, auth.api_key, id, {
        variables,
      });
      console.log(`PDE_GATE_REGIONS_SET package=${pkg.package_id}`);
      console.log(JSON.stringify(pkg.variables, null, 2));
      return;
    }
    if (sub === "create") {
      const name = flag(args, "--name");
      const file = flag(args, "--file");
      const regions = csv(flag(args, "--regions")) ?? [
        "australia-southeast1",
        "australia-southeast2",
      ];
      const zones = csv(flag(args, "--zones")) ?? [
        "australia-southeast1-a",
        "australia-southeast1-b",
      ];
      let body: {
        name: string;
        description?: string;
        platforms?: string[];
        policy_groups?: Record<string, string[]>;
        variables?: Record<string, unknown>;
      };
      if (file) {
        body = JSON.parse(fs.readFileSync(file, "utf8"));
        if (name) body.name = name;
      } else if (name) {
        body = {
          name,
          platforms: ["gcp"],
          policy_groups: {
            google_vpc_access_connector: ["region", "network"],
          },
          variables: {
            approved_regions: regions,
            approved_zones: zones,
            google_provider_version: "7.37.0",
          },
        };
      } else {
        console.error("package create requires --name or --file");
        process.exit(1);
      }
      const pkg = await api.createPackage(auth.api_url, auth.org_id, auth.api_key, body);
      console.log(`PDE_GATE_PACKAGE_CREATED ${pkg.package_id}`);
      console.log(JSON.stringify(pkg, null, 2));
      return;
    }
    usage();
  }

  if (cmd === "check") {
    const planPath = flag(args, "--plan");
    const packageId = flag(args, "--package");
    const platform = flag(args, "--platform");
    if (!planPath || !packageId) {
      console.error("check requires --plan and --package");
      process.exit(1);
    }
    const auth = resolveAuth();
    const plan = JSON.parse(fs.readFileSync(planPath, "utf8")) as Record<string, unknown>;
    const result = await api.runRemoteCheck(auth.api_url, auth.org_id, auth.api_key, {
      package_id: packageId,
      plan,
      platform,
      // Fully enforce versions by default; relax with --no-strict-versions
      strict_versions: !has(args, "--no-strict-versions"),
    });
    for (const w of result.warnings ?? []) console.log(`PDE_GATE_WARN ${w}`);
    if (result.org_config) {
      console.log(`PDE_GATE_ORG_CONFIG ${JSON.stringify(result.org_config)}`);
    }
    console.log(
      `PDE_GATE_RESULT ok=${result.ok} platform=${result.platform} package=${result.package_id} evaluated=${result.evaluated} failures=${result.failures.length}`
    );
    for (const f of result.failures) {
      console.log(`PDE_GATE_FAIL policy=${f.policy}`);
      console.log(JSON.stringify(f.message));
    }
    process.exit(result.ok ? 0 : 1);
  }

  usage();
}

main().catch((err) => {
  console.error(err instanceof Error ? err.message : err);
  process.exit(1);
});
