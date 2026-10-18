"use strict";

/**
 * A database created before 20260913000100 (tables made outside the migrations)
 * lacks the constraints that migration creates. Add each one that is missing:
 * - orgs.contact_email unique (register relies on it to refuse a duplicate email);
 * - packages (org_id, package_id) unique;
 * - packages.org_id → orgs.org_id, ON DELETE CASCADE.
 * Fails, changing nothing further, if existing rows break a constraint (e.g. two
 * orgs with one email): fix the data and run it again.
 */
async function indexes(queryInterface, table) {
  return queryInterface.showIndex(table);
}

function hasUnique(list, columns) {
  return list.some(
    (index) =>
      index.unique &&
      index.fields.length === columns.length &&
      index.fields.every((field, i) => field.attribute === columns[i])
  );
}

module.exports = {
  async up(queryInterface) {
    if (!hasUnique(await indexes(queryInterface, "orgs"), ["contact_email"])) {
      await queryInterface.addIndex("orgs", ["contact_email"], { unique: true, name: "contact_email" });
    }

    if (!hasUnique(await indexes(queryInterface, "packages"), ["org_id", "package_id"])) {
      await queryInterface.addIndex("packages", ["org_id", "package_id"], {
        unique: true,
        name: "packages_org_id_package_id",
      });
    }

    const foreignKeys = await queryInterface.getForeignKeyReferencesForTable("packages");
    if (!foreignKeys.some((fk) => fk.columnName === "org_id" && fk.referencedTableName === "orgs")) {
      await queryInterface.addConstraint("packages", {
        fields: ["org_id"],
        type: "foreign key",
        name: "packages_ibfk_1",
        references: { table: "orgs", field: "org_id" },
        onDelete: "CASCADE",
        onUpdate: "NO ACTION",
      });
    }
  },

  async down() {
    // Kept: 20260913000100 creates the same constraints on a new database.
  },
};
