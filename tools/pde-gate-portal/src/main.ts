import { createApp } from "./server.js";

const PORT = Number(process.env.PDE_PORTAL_PORT ?? 3848);

function main() {
  const app = createApp();
  app.listen(PORT, () => {
    console.log(`pde-gate-portal listening on http://127.0.0.1:${PORT}`);
  });
}

main();
