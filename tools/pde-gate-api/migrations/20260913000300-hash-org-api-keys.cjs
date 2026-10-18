"use strict";

/**
 * Store API keys hashed. A database created before 20260913000100 has a plaintext
 * `token` column: hash each key in place (sha256 hex, as store.ts hashApiKey does)
 * into `api_key_hash` and drop `token`. Existing keys keep working.
 */
module.exports = {
  async up(queryInterface, Sequelize) {
    const table = await queryInterface.describeTable("orgs");
    if (!table.token) return;
    await queryInterface.addColumn("orgs", "api_key_hash", {
      type: Sequelize.CHAR(64),
      allowNull: true,
    });
    await queryInterface.sequelize.query("UPDATE orgs SET api_key_hash = SHA2(token, 256)");
    await queryInterface.changeColumn("orgs", "api_key_hash", {
      type: Sequelize.CHAR(64),
      allowNull: false,
      unique: true,
    });
    await queryInterface.removeColumn("orgs", "token");
  },

  async down() {
    // Irreversible: the plaintext keys are gone.
  },
};
