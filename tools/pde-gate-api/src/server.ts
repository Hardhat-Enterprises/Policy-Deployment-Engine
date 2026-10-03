import express from 'express';
import {
    createOrg,
    loginOrg,
    createPackage,
    deletePackage,
    findOrgByKey,
    getPackage,
    listPackages,
    updatePackage,
} from './store.js';
import { runServerCheck } from './engine/run-check.js';
import type { CreatePackageRequest, RegisterRequest } from './types.js';

function parseBearer(header: string | undefined): string | null {
    if (!header?.startsWith('Bearer ')) return null;
    const token = header.slice('Bearer '.length).trim();
    return token || null;
}

function param(value: string | string[] | undefined): string {
    if (Array.isArray(value)) return value[0] ?? '';
    return value ?? '';
}

async function requireOrg(
    req: express.Request,
    res: express.Response
): Promise<{ orgId: string } | null> {
    const orgId = param(req.params.orgId);
    const key = parseBearer(req.header('authorization'));
    if (!key) {
        res.status(401).json({ error: 'Authorization: Bearer <PDE_API_KEY> required' });
        return null;
    }
    const org = await findOrgByKey(orgId, key);
    if (!org) {
        res.status(401).json({ error: 'Invalid org_id or api_key' });
        return null;
    }
    return { orgId };
}

export function createApp() {
    const app = express();
    app.use(express.json({ limit: process.env.PDE_JSON_LIMIT || '32mb' }));

    app.get('/', (_req, res) => {
        res.json({ status: 'ok', service: 'pde-gate-api' });
    });

    app.get('/health', (_req, res) => {
        res.json({ status: 'ok', service: 'pde-gate-api' });
    });

    app.post('/v1/orgs/register', async (req, res) => {
        const body = req.body as Partial<RegisterRequest> & { password?: string };
        if (!body.org_name?.trim()) {
            res.status(400).json({ error: 'org_name is required' });
            return;
        }
        if (!body.contact_email?.trim()) {
            res.status(400).json({ error: 'contact_email is required' });
            return;
        }
        try {
            const { org, api_key } = await createOrg({
                org_name: body.org_name,
                contact_email: body.contact_email,
                password: body.password,
            });
            res.status(201).json({
                org_id: org.org_id,
                api_key,
                message: 'Organisation registered. Store api_key as PDE_API_KEY in CI.',
            });
        } catch (err: unknown) {
            const e = err as { name?: string; message?: string };
            if (e.name === 'SequelizeUniqueConstraintError') {
                res.status(409).json({
                    error: `Organisation with contact_email '${body.contact_email}' already exists. Use 'login' command to recover api_key.`,
                });
                return;
            }
            res.status(500).json({ error: e.message || String(err) });
        }
    });

    app.post('/v1/orgs/login', async (req, res) => {
        const body = req.body as { contact_email?: string; email?: string; password?: string };
        const email = (body.contact_email || body.email)?.trim();
        const password = body.password?.trim();
        if (!email || !password) {
            res.status(400).json({ error: 'email and password are required' });
            return;
        }
        try {
            const result = await loginOrg(email, password);
            if (!result) {
                res.status(401).json({ error: 'Invalid email or password' });
                return;
            }
            res.json({
                org_id: result.org.org_id,
                api_key: result.api_key,
                message: 'Login successful. Recovered api_key for PDE_API_KEY.',
            });
        } catch (err: unknown) {
            const e = err as { message?: string };
            res.status(500).json({ error: e.message || String(err) });
        }
    });

    app.get('/v1/orgs/:orgId', async (req, res) => {
        const auth = await requireOrg(req, res);
        if (!auth) return;
        const org = await findOrgByKey(auth.orgId, parseBearer(req.header('authorization'))!);
        res.json({
            org_id: org!.org_id,
            org_name: org!.org_name,
            contact_email: org!.contact_email,
            registered_at: org!.registered_at.toISOString(),
        });
    });

    app.get('/v1/orgs/:orgId/packages', async (req, res) => {
        const auth = await requireOrg(req, res);
        if (!auth) return;
        res.json({ packages: await listPackages(auth.orgId) });
    });

    app.post('/v1/orgs/:orgId/packages', async (req, res) => {
        const auth = await requireOrg(req, res);
        if (!auth) return;
        const body = req.body as Partial<CreatePackageRequest>;
        if (!body.name?.trim()) {
            res.status(400).json({ error: 'name is required' });
            return;
        }
        const pkg = await createPackage(auth.orgId, {
            name: body.name,
            description: body.description,
            platforms: body.platforms,
            policy_groups: body.policy_groups,
            variables: body.variables,
        });
        res.status(201).json(pkg);
    });

    app.get('/v1/orgs/:orgId/packages/:packageId', async (req, res) => {
        const auth = await requireOrg(req, res);
        if (!auth) return;
        const pkg = await getPackage(auth.orgId, param(req.params.packageId));
        if (!pkg) {
            res.status(404).json({ error: 'package not found' });
            return;
        }
        res.json(pkg);
    });

    app.patch('/v1/orgs/:orgId/packages/:packageId', async (req, res) => {
        const auth = await requireOrg(req, res);
        if (!auth) return;
        const pkg = await updatePackage(auth.orgId, param(req.params.packageId), req.body);
        if (!pkg) {
            res.status(404).json({ error: 'package not found' });
            return;
        }
        res.json(pkg);
    });

    app.delete('/v1/orgs/:orgId/packages/:packageId', async (req, res) => {
        const auth = await requireOrg(req, res);
        if (!auth) return;
        const ok = await deletePackage(auth.orgId, param(req.params.packageId));
        if (!ok) {
            res.status(404).json({ error: 'package not found' });
            return;
        }
        res.status(204).end();
    });

    app.post('/v1/orgs/:orgId/checks', async (req, res) => {
        const auth = await requireOrg(req, res);
        if (!auth) return;

        const body = req.body as {
            package_id?: string;
            plan?: Record<string, unknown>;
            platform?: string;
            strict_versions?: boolean;
        };

        if (!body.package_id?.trim()) {
            res.status(400).json({ error: 'package_id is required' });
            return;
        }
        if (!body.plan || typeof body.plan !== 'object') {
            res.status(400).json({ error: 'plan (terraform show -json object) is required' });
            return;
        }

        try {
            const result = await runServerCheck({
                orgId: auth.orgId,
                packageId: body.package_id.trim(),
                plan: body.plan,
                platform: body.platform,
                strictVersions: body.strict_versions,
            });
            res.status(result.ok ? 200 : 422).json(result);
        } catch (err: unknown) {
            const e = err as { status?: number; message?: string };
            const status = e.status ?? 500;
            res.status(status).json({ error: e.message || String(err) });
        }
    });

    return app;
}
