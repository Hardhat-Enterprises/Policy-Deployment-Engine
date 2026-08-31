import fs from 'node:fs';
import path from 'node:path';

export type PolicyTarget = {
    file: string;
    dir: string;
    packageName: string;
    resourceType: string;
};

export function findHelpersDir(policiesRoot: string): string {
    const direct = path.join(policiesRoot, '_helpers');
    if (fs.existsSync(direct) && fs.statSync(direct).isDirectory()) {
        return direct;
    }
    const nested = path.join(policiesRoot, '..', '_helpers');
    if (fs.existsSync(path.resolve(nested))) {
        return path.resolve(nested);
    }
    throw new Error(
        `Could not find policies/_helpers under ${policiesRoot}. Pass the PDE policies/ directory.`
    );
}

function parsePackage(regoText: string): string | null {
    const m = regoText.match(/^package\s+([a-zA-Z0-9_.]+)/m);
    return m ? m[1] : null;
}

function parseResourceType(varsText: string): string | null {
    const m = varsText.match(/"resource_type"\s*:\s*"([^"]+)"/);
    return m ? m[1] : null;
}

export function discoverPolicies(policiesRoot: string): PolicyTarget[] {
    const out: PolicyTarget[] = [];
    const walk = (dir: string) => {
        if (path.basename(dir) === '_helpers') return;
        for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
            const full = path.join(dir, entry.name);
            if (entry.isDirectory()) {
                walk(full);
                continue;
            }
            if (!entry.name.endsWith('.rego') || entry.name === '_vars.rego') continue;
            const varsFile = path.join(dir, '_vars.rego');
            if (!fs.existsSync(varsFile)) continue;
            const resourceType = parseResourceType(fs.readFileSync(varsFile, 'utf8'));
            const packageName = parsePackage(fs.readFileSync(full, 'utf8'));
            if (!resourceType || !packageName) continue;
            out.push({ file: full, dir, packageName, resourceType });
        }
    };
    walk(policiesRoot);
    return out;
}

import type { PlanResource } from "./plan-normalise.js";

export function resourcesFromPlan(plan: unknown): PlanResource[] {
    const root = plan as { planned_values?: { root_module?: { resources?: PlanResource[] } } };
    return root?.planned_values?.root_module?.resources ?? [];
}

function planResources(planPath: string): PlanResource[] {
    const plan = JSON.parse(fs.readFileSync(planPath, "utf8"));
    return resourcesFromPlan(plan);
}

export function resourceTypesFromPlan(plan: unknown): Set<string> {
    return new Set(
        resourcesFromPlan(plan)
            .map((r) => r.type)
            .filter(Boolean) as string[]
    );
}

export function resourceNamesFromPlan(plan: unknown, resourceType: string): string[] {
    return resourcesFromPlan(plan)
        .filter((r) => r.type === resourceType && r.name)
        .map((r) => r.name as string);
}

export function resourceTypesInPlan(planPath: string): Set<string> {
    return resourceTypesFromPlan(JSON.parse(fs.readFileSync(planPath, "utf8")));
}

export function resourceNamesInPlan(planPath: string, resourceType: string): string[] {
    return resourceNamesFromPlan(JSON.parse(fs.readFileSync(planPath, "utf8")), resourceType);
}
