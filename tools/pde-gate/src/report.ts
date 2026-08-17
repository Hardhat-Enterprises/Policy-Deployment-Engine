export type CheckResult = {
    policy: string;
    resourceType: string;
    status: "PASSED" | "FAILED";
    message: unknown;
    resourceNames: string[];
};

export type Finding = {
    policy: string;
    parameter: string;
    resource: string;
    status: "PASSED" | "FAILED";
    reason: string;
};

export type PolicyBlock = {
    policy: string;
    parameter: string;
    failed: Finding[];
    passed: string[];
};

export type GateReport = {
    summary: { policies: number; failed: number; passed: number };
    policies: PolicyBlock[];
};

function asStringArray(value: unknown): string[] {
    if (!Array.isArray(value)) return [];
    return value.flatMap((item) => (typeof item === "string" ? [item] : asStringArray(item)));
}

export function policyParameter(policy: string): string {
    const parts = policy.split(".");
    return parts[parts.length - 1] ?? policy;
}

export function parseOpaMessage(message: unknown): {
    situation: string;
    resources: string[];
    remedies: string[];
} {
    const lines = asStringArray(message);
    const situation =
        lines.find((l) => l.startsWith("Situation "))?.replace(/^Situation \d+:\s*/, "") ?? "";
    const ncLine = lines.find((l) => l.startsWith("Non-Compliant Resources:")) ?? "";
    const raw = ncLine.replace("Non-Compliant Resources:", "").trim();
    const resources =
        !raw || raw === "None - All passed"
            ? []
            : raw.split(",").map((s) => s.trim()).filter(Boolean);
    const remLine = lines.find((l) => l.startsWith("Potential Remedies:")) ?? "";
    const remedies = remLine ? [remLine.replace("Potential Remedies:", "").trim()].filter(Boolean) : [];
    return { situation, resources, remedies };
}

export function toGateReport(results: CheckResult[]): GateReport {
    const policies: PolicyBlock[] = results.map((r) => {
        const parsed = parseOpaMessage(r.message);
        const parameter = policyParameter(r.policy);
        const failedNames = new Set(parsed.resources);
        const reason = parsed.remedies[0] || parsed.situation || "policy check failed";
        const failed: Finding[] = [...failedNames].map((resource) => ({
            policy: r.policy,
            parameter,
            resource,
            status: "FAILED" as const,
            reason,
        }));
        const passed = r.resourceNames.filter((name) => !failedNames.has(name));
        return { policy: r.policy, parameter, failed, passed };
    });

    const failed = policies.reduce((n, p) => n + p.failed.length, 0);
    const passed = policies.reduce((n, p) => n + p.passed.length, 0);
    return {
        summary: { policies: results.length, failed, passed },
        policies,
    };
}

export function printTextReport(report: GateReport): void {
    const { summary } = report;
    console.log(
        `PDE_GATE_SUMMARY policies=${summary.policies} failed=${summary.failed} passed=${summary.passed}`
    );
    for (const block of report.policies) {
        for (const f of block.failed) {
            console.log(
                `FAILED id=${f.resource} parameter=${f.parameter} reason="${f.reason}"`
            );
            if (process.env.GITHUB_ACTIONS === "true") {
                console.log(
                    `::error title=PDE ${f.parameter} failed::${f.resource}: ${f.reason}`
                );
            }
        }
        if (block.passed.length) {
            console.log(`passed=${block.passed.join(",")}`);
        }
    }
}

export function printJsonReport(report: GateReport): void {
    console.log(JSON.stringify(report, null, 2));
}
