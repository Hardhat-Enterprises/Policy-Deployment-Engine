import { spawn } from "node:child_process";

function runOpa(args: string[]): Promise<{ stdout: string; stderr: string }> {
    return new Promise((resolve, reject) => {
        const child = spawn("opa", args, { stdio: ["ignore", "pipe", "pipe"] });
        let stdout = "";
        let stderr = "";
        child.stdout.on("data", (chunk: Buffer) => {
            stdout += chunk.toString();
        });
        child.stderr.on("data", (chunk: Buffer) => {
            stderr += chunk.toString();
        });
        child.on("error", (err) => reject(err));
        child.on("close", (code) => {
            if (code === 0) {
                resolve({ stdout, stderr });
            } else {
                const err = new Error(stderr || `opa exited with code ${code}`) as Error & {
                    stderr?: string;
                    code?: number;
                };
                err.stderr = stderr;
                err.code = code ?? undefined;
                reject(err);
            }
        });
    });
}

export async function opaEvalMessage(
    helpersDir: string,
    policyDir: string,
    planPath: string,
    packageName: string
): Promise<unknown> {
    const query = `data.${packageName}.message`;
    try {
        const { stdout } = await runOpa([
            "eval",
            "--data",
            helpersDir,
            "--data",
            policyDir,
            "--input",
            planPath,
            "--format",
            "json",
            query,
        ]);
        const payload = JSON.parse(stdout);
        return payload?.result?.[0]?.expressions?.[0]?.value ?? null;
    } catch (err: unknown) {
        const e = err as { stderr?: string; message?: string; code?: string };
        if (e.code === "ENOENT" || e.message?.includes("ENOENT")) {
            throw new Error("opa binary not found on PATH. Install OPA ~1.2 to match PDE.");
        }
        throw new Error(`OPA eval failed for ${query}\n${e.stderr || e.message || String(err)}`);
    }
}

export function isPolicyFailure(message: unknown): boolean {
    const text = JSON.stringify(message ?? "");
    if (!text.includes("Non-Compliant Resources:")) return false;
    return !text.includes("None - All passed");
}
