"use strict";

module.exports = {
  async up(queryInterface, Sequelize) {
    const table = await queryInterface.describeTable("packages");
    if (!table.platforms) {
      await queryInterface.addColumn("packages", "platforms", {
        type: Sequelize.JSON,
        allowNull: false,
        defaultValue: ["gcp"],
      });
    }
  },

  async down(queryInterface) {
    const table = await queryInterface.describeTable("packages");
    if (table.platforms) {
      await queryInterface.removeColumn("packages", "platforms");
    }
  },
};
