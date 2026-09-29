import { Sequelize } from "sequelize";
import dotenv from "dotenv";

dotenv.config();

export const sequelize = new Sequelize(
  process.env.PDE_DB_NAME || "pde_gate",
  process.env.PDE_DB_USER || "pde",
  process.env.PDE_DB_PASSWORD || "pde",
  {
    host: process.env.PDE_DB_HOST || "127.0.0.1",
    port: Number(process.env.PDE_DB_PORT || 3306),
    dialect: "mysql",
    logging: false,
  }
);
