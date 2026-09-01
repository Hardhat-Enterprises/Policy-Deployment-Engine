/**
 * Runtime configuration for pde-gate (portal/API URLs, credential paths).
 * Priority: CLI flags → environment variables → package defaults → local config file.
 *
 * Version-normalisation registry paths plug in via plan-normalise.ts later — no change here.
 */

import fs from "node:fs";
import os from "node:os";
import path from "node:path";

/** Shipped defaults for Hardhat-hosted SaaS (override for on-prem). */
export const PACKAGE_DEFAULTS = {
    portalUrl: "https://portal.pde.hardhat.example.com",
    apiUrl: "https://api.pde.hardhat.example.com",
} as const;

export type GateEndpoints = {
    portalUrl: string;
    apiUrl: string;
};

export type GateConfigPaths = {
    credentialsFile: string;
    localConfigFile: string;
};

export function gateConfigDir(): string {
    return process.env.PDE_GATE_CONFIG_DIR ?? path.join(os.homedir(), ".pde-gate");
}

export function gateConfigPaths(): GateConfigPaths {
    const dir = gateConfigDir();
    return {
        credentialsFile: path.join(dir, "credentials.json"),
        localConfigFile: path.join(dir, "config.json"),
    };
}

function readLocalEndpointOverrides(): Partial<GateEndpoints> {
    const { localConfigFile } = gateConfigPaths();
    if (!fs.existsSync(localConfigFile)) {
        return {};
    }
    try {
        const raw = JSON.parse(fs.readFileSync(localConfigFile, "utf8")) as Partial<GateEndpoints>;
        return {
            portalUrl: raw.portalUrl ? String(raw.portalUrl) : undefined,
            apiUrl: raw.apiUrl ? String(raw.apiUrl) : undefined,
        };
    } catch {
        return {};
    }
}

/** Resolve portal + API URLs for register and remote config fetch. */
export function resolveEndpoints(overrides: Partial<GateEndpoints> = {}): GateEndpoints {
    const local = readLocalEndpointOverrides();
    return {
        portalUrl:
            overrides.portalUrl ??
            process.env.PDE_PORTAL_URL ??
            local.portalUrl ??
            PACKAGE_DEFAULTS.portalUrl,
        apiUrl:
            overrides.apiUrl ??
            process.env.PDE_API_URL ??
            local.apiUrl ??
            PACKAGE_DEFAULTS.apiUrl,
    };
}

export function portalRegisterUrl(endpoints: GateEndpoints = resolveEndpoints()): string {
    const base = endpoints.portalUrl.replace(/\/$/, "");
    return `${base}/register`;
}
