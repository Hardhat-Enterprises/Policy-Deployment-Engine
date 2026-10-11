import { spawn } from 'node:child_process';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';

const attributeMappingRegistry: Record<string, string> = {
    "region": "approved_regions",
    "zone": "approved_zones",
    "location": "approved_regions"
};

export function writeJitPolicyDir(originalDir: string, tempBaseDir: string, orgConfig: Record<string, any>): string {
    const policyName = path.basename(originalDir);
    const jitDir = path.join(tempBaseDir, policyName);
    fs.mkdirSync(jitDir, { recursive: true });
    
    for (const file of fs.readdirSync(originalDir)) {
        if (!file.endsWith('.rego')) continue;
        
        let text = fs.readFileSync(path.join(originalDir, file), 'utf8');
        
        // JIT Compiler: Dynamically inject org variables into static Rego policies (Whitelists ONLY)
        for (const [attr, varName] of Object.entries(attributeMappingRegistry)) {
            if (orgConfig && Array.isArray(orgConfig[varName])) {
                // Positive lookahead ensures we only overwrite 'values' if it is a whitelist policy
                const regex = new RegExp(`("attribute_path"\\s*:\\s*\\[\\s*"${attr}"\\s*\\]\\s*,[\\s\\n]*)"values"\\s*:\\s*\\[.*?\\](?=[\\s\\n]*,[\\s\\n]*"policy_type"\\s*:\\s*"whitelist")`, 'gs');
                text = text.replace(regex, `$1"values": ${JSON.stringify(orgConfig[varName])}`);
            }
        }
        
        fs.writeFileSync(path.join(jitDir, file), text);
    }
    return jitDir;
}

function runOpa(args: string[]): Promise<{ stdout: string; stderr: string }> {
    return new Promise((resolve, reject) => {
        const child = spawn('opa', args, { stdio: ['ignore', 'pipe', 'pipe'] });
        let stdout = '';
        let stderr = '';
        child.stdout.on('data', (c: Buffer) => {
            stdout += c.toString();
        });
        child.stderr.on('data', (c: Buffer) => {
            stderr += c.toString();
        });
        child.on('error', reject);
        child.on('close', (code) => {
            if (code === 0) resolve({ stdout, stderr });
            else reject(new Error(stderr || `opa exited ${code}`));
        });
    });
}

export async function opaEvalMessage(
    helpersDir: string,
    policyDir: string,
    inputPath: string,
    packageName: string
): Promise<unknown> {
    const query = `data.${packageName}.message`;
    const { stdout } = await runOpa([
        'eval',
        '--data',
        helpersDir,
        '--data',
        policyDir,
        '--input',
        inputPath,
        '--format',
        'json',
        query,
    ]);
    const payload = JSON.parse(stdout);
    return payload?.result?.[0]?.expressions?.[0]?.value ?? null;
}

export function isPolicyFailure(message: unknown): boolean {
    const text = JSON.stringify(message ?? '');
    // Match "Non-Compliant Resources: <something>" that is not the all-passed marker.
    const re = /Non-Compliant Resources:\s*([^"]*)/g;
    let m: RegExpExecArray | null;
    while ((m = re.exec(text)) !== null) {
        const value = (m[1] ?? '').trim();
        if (value && !value.startsWith('None - All passed')) return true;
    }
    return false;
}

export function writeTempInput(plan: unknown): string {
    const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'pde-gate-'));
    const file = path.join(dir, 'input.json');
    fs.writeFileSync(file, JSON.stringify(plan));
    return file;
}
