#!/usr/bin/env node
import { spawnSync } from "node:child_process";
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const distCli = path.join(root, "dist", "cli.js");
const srcCli = path.join(root, "src", "cli.ts");
const args = process.argv.slice(2);
const tsxBin = path.join(root, "node_modules", ".bin", "tsx");

function runTsx() {
    if (!fs.existsSync(tsxBin)) {
        console.error("pde-gate: run `npm install` in tools/pde-gate first.");
        process.exit(1);
    }
    const child = spawnSync(tsxBin, [srcCli, ...args], { stdio: "inherit", cwd: root });
    process.exit(child.status ?? 1);
}

// Local dev: always run TypeScript source via tsx (no build step).
if (fs.existsSync(tsxBin)) {
    runTsx();
}

if (fs.existsSync(distCli)) {
    const child = spawnSync(process.execPath, [distCli, ...args], { stdio: "inherit" });
    process.exit(child.status ?? 1);
}

console.error("pde-gate: run `npm install` in tools/pde-gate first.");
process.exit(1);
