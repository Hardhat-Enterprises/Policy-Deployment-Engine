import { createApp } from "./server.js";
import { sequelize } from "./db/sequelize.js";
import "./db/models/index.js";

const PORT = Number(process.env.PDE_PORTAL_PORT ?? process.env.PDE_API_PORT ?? 3847);

async function main() {
  await sequelize.authenticate();
  const app = createApp();
  app.listen(PORT, () => {
    console.log(`pde-gate-api listening on http://127.0.0.1:${PORT}`);
  });
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
