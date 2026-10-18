import express from "express";
import path from "node:path";
import { fileURLToPath } from "node:url";

const publicDir = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..", "public");

export function createApp(options: { apiUrl?: string } = {}) {
  const API_URL = options.apiUrl ?? process.env.PDE_API_URL ?? "http://127.0.0.1:3847";
  const app = express();
  app.use(express.json({ limit: "32mb" }));
  app.use(express.static(publicDir));

  app.get("/", (_req, res) => {
    res.redirect("/register");
  });

  app.get("/register", (_req, res) => {
    res.sendFile(path.join(publicDir, "register.html"));
  });

  app.get("/settings", (_req, res) => {
    res.sendFile(path.join(publicDir, "settings.html"));
  });

  app.get("/packages", (_req, res) => {
    res.sendFile(path.join(publicDir, "packages.html"));
  });

  app.get("/check", (_req, res) => {
    res.sendFile(path.join(publicDir, "check.html"));
  });

  app.get("/health", (_req, res) => {
    res.json({ status: "ok", service: "pde-gate-portal", api_url: API_URL });
  });

  app.all("/v1/*", async (req, res) => {
    try {
      const targetUrl = `${API_URL.replace(/\/$/, "")}${req.originalUrl}`;
      const headers: Record<string, string> = {
        Accept: "application/json",
      };
      if (req.header("authorization")) {
        headers.Authorization = req.header("authorization")!;
      }
      if (req.header("content-type")) {
        headers["Content-Type"] = req.header("content-type")!;
      }
      // The API rate-limits register and login per client IP. Pass the browser's
      // address on, so the API (with PDE_TRUST_PROXY set) does not count every
      // request as the portal's.
      const forwardedFor = req.header("x-forwarded-for");
      const clientAddress = req.socket.remoteAddress ?? "";
      headers["X-Forwarded-For"] = forwardedFor ? `${forwardedFor}, ${clientAddress}` : clientAddress;

      const response = await fetch(targetUrl, {
        method: req.method,
        headers,
        body: ["POST", "PUT", "PATCH"].includes(req.method)
          ? JSON.stringify(req.body)
          : undefined,
      });

      const data = await response.text();
      res.status(response.status);
      res.set("Content-Type", response.headers.get("content-type") || "application/json");
      res.send(data);
    } catch (err: unknown) {
      const e = err as { message?: string };
      res.status(502).json({
        error: `Failed to connect to backend API at ${API_URL}: ${e.message || String(err)}`,
      });
    }
  });

  return app;
}
