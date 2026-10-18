"use strict";

/**
 * Create the orgs and packages tables (greenfield databases).
 *
 * Skips a table that already exists, so a database created before this migration
 * keeps its data; 20260913000200 and 20260913000300 bring such a database up to date.
 * JSON columns carry no DB default (MySQL rejects literal JSON defaults); the
 * Sequelize models supply them.
 */
module.exports = {
  async up(queryInterface, Sequelize) {
    const tables = (await queryInterface.showAllTables()).map((t) =>
      typeof t === "string" ? t : t.tableName
    );

    if (!tables.includes("orgs")) {
      await queryInterface.createTable("orgs", {
        org_id: { type: Sequelize.STRING(64), allowNull: false, primaryKey: true },
        api_key_hash: { type: Sequelize.CHAR(64), allowNull: false, unique: true },
        schema_version: { type: Sequelize.STRING(16), allowNull: false, defaultValue: "1" },
        org_name: { type: Sequelize.STRING(255), allowNull: false },
        registered_at: { type: Sequelize.DATE, allowNull: false },
        approved_regions: { type: Sequelize.JSON, allowNull: false },
        approved_zones: { type: Sequelize.JSON, allowNull: false },
        contact_email: { type: Sequelize.STRING(255), allowNull: false, unique: true },
        password_hash: { type: Sequelize.STRING(255), allowNull: true },
        created_at: { type: Sequelize.DATE, allowNull: false },
        updated_at: { type: Sequelize.DATE, allowNull: false },
      });
    }

    if (!tables.includes("packages")) {
      await queryInterface.createTable("packages", {
        id: { type: Sequelize.INTEGER.UNSIGNED, autoIncrement: true, primaryKey: true },
        org_id: {
          type: Sequelize.STRING(64),
          allowNull: false,
          references: { model: "orgs", key: "org_id" },
          onDelete: "CASCADE",
        },
        package_id: { type: Sequelize.STRING(64), allowNull: false },
        name: { type: Sequelize.STRING(255), allowNull: false },
        description: { type: Sequelize.TEXT, allowNull: true },
        platforms: { type: Sequelize.JSON, allowNull: false },
        policy_groups: { type: Sequelize.JSON, allowNull: false },
        variables: { type: Sequelize.JSON, allowNull: true },
        package_updated_at: { type: Sequelize.DATE, allowNull: false },
        created_at: { type: Sequelize.DATE, allowNull: false },
        updated_at: { type: Sequelize.DATE, allowNull: false },
      });
      await queryInterface.addIndex("packages", ["org_id", "package_id"], {
        unique: true,
        name: "packages_org_id_package_id",
      });
    }
  },

  async down(queryInterface) {
    await queryInterface.dropTable("packages");
    await queryInterface.dropTable("orgs");
  },
};
