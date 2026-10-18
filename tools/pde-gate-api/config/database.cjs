require("dotenv").config();

module.exports = {
  development: {
    username: process.env.PDE_DB_USER || "pde",
    password: process.env.PDE_DB_PASSWORD || "pde",
    database: process.env.PDE_DB_NAME || "pde_gate",
    host: process.env.PDE_DB_HOST || "127.0.0.1",
    port: Number(process.env.PDE_DB_PORT || 3306),
    dialect: "mysql",
    logging: false,
  },
  test: {
    username: process.env.PDE_DB_USER || "pde",
    password: process.env.PDE_DB_PASSWORD || "pde",
    database: process.env.PDE_DB_NAME || "pde_gate_test",
    host: process.env.PDE_DB_HOST || "127.0.0.1",
    port: Number(process.env.PDE_DB_PORT || 3306),
    dialect: "mysql",
    logging: false,
  },
  production: {
    username: process.env.PDE_DB_USER,
    password: process.env.PDE_DB_PASSWORD,
    database: process.env.PDE_DB_NAME,
    host: process.env.PDE_DB_HOST,
    port: Number(process.env.PDE_DB_PORT || 3306),
    dialect: "mysql",
    logging: false,
  },
};
