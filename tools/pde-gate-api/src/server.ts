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
import type { Org } from './db/models/index.js';
import { runServerCheck } from './engine/run-check.js';
import { HttpError } from './http-error.js';
import {
    bodyObject,
    optionalBoolean,
    optionalPlatform,
    optionalString,
    packageBody,
    requiredString,
} from './validate.js';
import type { CreatePackageRequest } from './types.js';

function parseBearer(header: string | undefined): string | null {
    if (!header?.startsWith('Bearer ')) return null;
    const token = header.slice('Bearer '.length).trim();
    return token || null;
}

/** Express params are typed as string | string[]; normalize to a single string. */
function param(value: string | string[] | undefined): string {
    if (Array.isArray(value)) return value[0] ?? '';
    return value ?? '';
}

type AsyncHandler = (req: express.Request, res: express.Response) => Promise<void>;

/**
 * Express 4 does not catch a rejected promise from a handler: the rejection
 * escapes and takes the process down. Every async route goes through this.
 */
function asyncRoute(handler: AsyncHandler): express.RequestHandler {
    return (req, res, next) => {
        handler(req, res).catch(next);
    };
}

/** The org the bearer key belongs to, or a 401. */
async function requireOrg(req: express.Request): Promise<Org> {
    const key = parseBearer(req.header('authorization'));
    if (!key) throw new HttpError(401, 'Authorization: Bearer <PDE_API_KEY> required');
    const org = await findOrgByKey(param(req.params.orgId), key);
    if (!org) throw new HttpError(401, 'Invalid org_id or api_key');
    return org;
}

/** Last middleware: known errors get their status, anything else a generic 500. */
const errorHandler: express.ErrorRequestHandler = (err, _req, res, _next) => {
    if (err instanceof HttpError) {
        res.status(err.status).json({ error: err.message });
        return;
    }
    // body-parser errors carry a client status (invalid JSON, body too large).
    const status = typeof err?.status === 'number' ? err.status : 500;
    if (status >= 400 && status < 500 && err?.expose) {
        res.status(status).json({
            error: err.type === 'entity.too.large' ? 'request body too large' : 'invalid request body',
        });
        return;
    }
    console.error(err);
    res.status(500).json({ error: 'internal server error' });
};

export function createApp() {
    const app = express();
    // Plans can be large — client uploads terraform show -json
    app.use(express.json({ limit: process.env.PDE_JSON_LIMIT || '32mb' }));

    app.get('/health', (_req, res) => {
        res.json({ status: 'ok', service: 'pde-gate-api' });
    });

    app.post('/v1/orgs/register', asyncRoute(async (req, res) => {
        const body = bodyObject(req.body);
        const org_name = requiredString(body, 'org_name');
        const contact_email = requiredString(body, 'contact_email');
        const password = optionalString(body, 'password', 1024);
        try {
            const { org, api_key } = await createOrg({ org_name, contact_email, password });
            res.status(201).json({
                org_id: org.org_id,
                api_key,
                message: 'Organisation registered. Store api_key as PDE_API_KEY in CI.',
            });
        } catch (err: unknown) {
            if ((err as { name?: string }).name === 'SequelizeUniqueConstraintError') {
                throw new HttpError(
                    409,
                    `Organisation with contact_email '${contact_email}' already exists. Use 'login' to get a new api_key.`
                );
            }
            throw err;
        }
    }));

    app.post('/v1/orgs/login', asyncRoute(async (req, res) => {
        const body = bodyObject(req.body);
        const raw = body.contact_email ?? body.email;
        if (raw !== undefined && typeof raw !== 'string') throw new HttpError(400, 'email must be a string');
        if (body.password !== undefined && typeof body.password !== 'string') {
            throw new HttpError(400, 'password must be a string');
        }
        const email = (raw as string | undefined)?.trim();
        const password = (body.password as string | undefined)?.trim();
        if (!email || !password) throw new HttpError(400, 'email and password are required');
        const result = await loginOrg(email, password);
        if (!result) throw new HttpError(401, 'Invalid email or password');
        res.json({
            org_id: result.org.org_id,
            api_key: result.api_key,
            message: 'Login successful. A new api_key was issued; the previous one no longer works.',
        });
    }));

    app.get('/v1/orgs/:orgId', asyncRoute(async (req, res) => {
        const org = await requireOrg(req);
        res.json({
            org_id: org.org_id,
            org_name: org.org_name,
            contact_email: org.contact_email,
            registered_at: org.registered_at.toISOString(),
        });
    }));

    app.get('/v1/orgs/:orgId/packages', asyncRoute(async (req, res) => {
        const org = await requireOrg(req);
        res.json({ packages: await listPackages(org.org_id) });
    }));

    app.post('/v1/orgs/:orgId/packages', asyncRoute(async (req, res) => {
        const org = await requireOrg(req);
        const body = packageBody(req.body, { partial: false }) as CreatePackageRequest;
        res.status(201).json(await createPackage(org.org_id, body));
    }));

    app.get('/v1/orgs/:orgId/packages/:packageId', asyncRoute(async (req, res) => {
        const org = await requireOrg(req);
        const pkg = await getPackage(org.org_id, param(req.params.packageId));
        if (!pkg) throw new HttpError(404, 'package not found');
        res.json(pkg);
    }));

    app.patch('/v1/orgs/:orgId/packages/:packageId', asyncRoute(async (req, res) => {
        const org = await requireOrg(req);
        const packageId = param(req.params.packageId);
        const existing = await getPackage(org.org_id, packageId);
        if (!existing) throw new HttpError(404, 'package not found');
        const body = packageBody(req.body, { partial: true, currentPlatforms: existing.platforms });
        const pkg = await updatePackage(org.org_id, packageId, body);
        if (!pkg) throw new HttpError(404, 'package not found');
        res.json(pkg);
    }));

    app.delete('/v1/orgs/:orgId/packages/:packageId', asyncRoute(async (req, res) => {
        const org = await requireOrg(req);
        const ok = await deletePackage(org.org_id, param(req.params.packageId));
        if (!ok) throw new HttpError(404, 'package not found');
        res.status(204).end();
    }));

    /**
     * Server-side policy check.
     * Client sends plan JSON + package_id; API loads Rego from PDE policies/ and runs OPA.
     * 200 = every selected policy passed; 422 = a policy failed, or the check is
     * incomplete (status "error": nothing evaluated, or a policy could not be).
     */
    app.post('/v1/orgs/:orgId/checks', asyncRoute(async (req, res) => {
        const org = await requireOrg(req);
        const body = bodyObject(req.body);
        const packageId = requiredString(body, 'package_id', 64);
        const plan = body.plan;
        if (typeof plan !== 'object' || plan === null || Array.isArray(plan)) {
            throw new HttpError(400, 'plan (terraform show -json object) is required');
        }
        const result = await runServerCheck({
            orgId: org.org_id,
            packageId,
            plan: plan as Record<string, unknown>,
            platform: optionalPlatform(body, 'platform'),
            strictVersions: optionalBoolean(body, 'strict_versions'),
        });
        res.status(result.ok ? 200 : 422).json(result);
    }));

    app.use(errorHandler);
    return app;
}
