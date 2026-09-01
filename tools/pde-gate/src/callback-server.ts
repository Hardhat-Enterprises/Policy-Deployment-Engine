import http from "node:http";

export type PortalCredentials = {
    org_id: string;
    token: string;
};

const LOCALHOST_HOSTS = new Set(["127.0.0.1", "localhost", "::1"]);

export function isLocalCallbackUrl(raw: string): boolean {
    try {
        const url = new URL(raw);
        if (url.protocol !== "http:") {
            return false;
        }
        return LOCALHOST_HOSTS.has(url.hostname);
    } catch {
        return false;
    }
}

export type CallbackServer = {
    callbackUrl: string;
    waitForCredentials: (timeoutMs?: number) => Promise<PortalCredentials>;
    close: () => Promise<void>;
};

/**
 * Ephemeral localhost server used during `register --mode portal`.
 * Portal POSTs org_id + token here so the user does not paste secrets manually.
 */
export async function startCallbackServer(): Promise<CallbackServer> {
    let resolveWait: (creds: PortalCredentials) => void;
    let rejectWait: (err: Error) => void;
    const credentialsPromise = new Promise<PortalCredentials>((resolve, reject) => {
        resolveWait = resolve;
        rejectWait = reject;
    });

    let settled = false;
    const settle = (fn: () => void) => {
        if (settled) {
            return;
        }
        settled = true;
        fn();
    };

    const server = http.createServer((req, res) => {
        const origin = req.headers.origin;
        if (origin) {
            res.setHeader("Access-Control-Allow-Origin", origin);
            res.setHeader("Vary", "Origin");
            res.setHeader("Access-Control-Allow-Methods", "POST, OPTIONS");
            res.setHeader("Access-Control-Allow-Headers", "Content-Type");
        }

        if (req.method === "OPTIONS") {
            res.writeHead(204);
            res.end();
            return;
        }

        if (req.method !== "POST" || req.url !== "/callback") {
            res.writeHead(404, { "Content-Type": "application/json" });
            res.end(JSON.stringify({ error: "not found" }));
            return;
        }

        const chunks: Buffer[] = [];
        req.on("data", (chunk: Buffer) => chunks.push(chunk));
        req.on("end", () => {
            try {
                const body = JSON.parse(Buffer.concat(chunks).toString("utf8")) as Partial<PortalCredentials>;
                const org_id = body.org_id?.trim();
                const token = body.token?.trim();
                if (!org_id || !token) {
                    res.writeHead(400, { "Content-Type": "application/json" });
                    res.end(JSON.stringify({ error: "org_id and token required" }));
                    return;
                }

                res.writeHead(200, { "Content-Type": "application/json" });
                res.end(JSON.stringify({ ok: true }));
                settle(() => resolveWait({ org_id, token }));
            } catch {
                res.writeHead(400, { "Content-Type": "application/json" });
                res.end(JSON.stringify({ error: "invalid JSON" }));
            }
        });
    });

    await new Promise<void>((resolve, reject) => {
        server.once("error", reject);
        server.listen(0, "127.0.0.1", () => resolve());
    });

    const addr = server.address();
    if (!addr || typeof addr === "string") {
        server.close();
        throw new Error("callback server failed to bind");
    }

    const callbackUrl = `http://127.0.0.1:${addr.port}/callback`;

    return {
        callbackUrl,
        waitForCredentials(timeoutMs = 5 * 60 * 1000) {
            return new Promise<PortalCredentials>((resolve, reject) => {
                const timer = setTimeout(() => {
                    settle(() =>
                        rejectWait(
                            new Error(
                                "Registration timed out. Complete signup in the browser or paste credentials manually."
                            )
                        )
                    );
                }, timeoutMs);

                credentialsPromise.then(
                    (creds) => {
                        clearTimeout(timer);
                        resolve(creds);
                    },
                    (err) => {
                        clearTimeout(timer);
                        reject(err);
                    }
                );
            });
        },
        close() {
            return new Promise<void>((resolve, reject) => {
                server.close((err) => (err ? reject(err) : resolve()));
            });
        },
    };
}
