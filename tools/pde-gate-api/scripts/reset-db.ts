/**
 * One-shot: reset local pde_gate schema to match greenfield migrations.
 * Loads credentials from .env — run: npx tsx scripts/reset-db.ts
 */
import dotenv from "dotenv";
import mysql from "mysql2/promise";

dotenv.config();

const db = process.env.PDE_DB_NAME || "pde_gate";

async function main() {
  const conn = await mysql.createConnection({
    host: process.env.PDE_DB_HOST || "127.0.0.1",
    port: Number(process.env.PDE_DB_PORT || 3306),
    user: process.env.PDE_DB_USER,
    password: process.env.PDE_DB_PASSWORD,
    multipleStatements: true,
  });
  await conn.query(`CREATE DATABASE IF NOT EXISTS \`${db}\``);
  await conn.query(`DROP DATABASE \`${db}\``);
  await conn.query(`CREATE DATABASE \`${db}\``);
  console.log(`Reset database ${db}`);
  await conn.end();
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
