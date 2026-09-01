import { createApp } from "./server.js";

const PORT = Number(process.env.PDE_PORTAL_PORT ?? 3847);
const app = createApp();

app.listen(PORT, () => {
    const base = `http://localhost:${PORT}`;
    console.log(`PDE Gate Portal API listening on ${base}`);
    console.log(`  Register UI:  ${base}/register`);
    console.log(`  Health:       ${base}/health`);
    console.log(`  Config API:   GET ${base}/v1/orgs/<org_id>/config`);
    console.log("");
    console.log("Point pde-gate at this server:");
    console.log(`  export PDE_PORTAL_URL=${base}`);
    console.log(`  export PDE_API_URL=${base}`);
});
