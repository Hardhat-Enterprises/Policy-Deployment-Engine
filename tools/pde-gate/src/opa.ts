import { execa } from 'execa';

export async function opaEvalMessage(
    helpersDir: string,
    policyDir: string,
    planPath: string,
    packageName: string
): Promise<unknown> {
    const query = `data.${packageName}.message`;
    try {
        const { stdout } = await execa('opa', [
            'eval',
            '--data',
            helpersDir,
            '--data',
            policyDir,
            '--input',
            planPath,
            '--format',
            'json',
            query,
        ]);
        const payload = JSON.parse(stdout);
        return payload?.result?.[0]?.expressions?.[0]?.value ?? null;
    } catch (err: unknown) {
        const e = err as { shortMessage?: string; stderr?: string; message?: string };
        if (e.shortMessage?.includes('opa') || e.message?.includes('ENOENT')) {
            throw new Error('opa binary not found on PATH. Install OPA ~1.2 to match PDE.');
        }
        throw new Error(`OPA eval failed for ${query}\n${e.stderr || e.message || String(err)}`);
    }
}

export function isPolicyFailure(message: unknown): boolean {
    const text = JSON.stringify(message ?? '');
    if (!text.includes('Non-Compliant Resources:')) return false;
    return !text.includes('None - All passed');
}
