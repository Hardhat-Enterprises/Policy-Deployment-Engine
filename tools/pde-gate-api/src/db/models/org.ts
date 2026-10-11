import { DataTypes, Model, Optional } from "sequelize";
import { sequelize } from "../sequelize.js";

/** Matches existing local `orgs` table (token + legacy org fields). */
export type OrgAttrs = {
  org_id: string;
  token: string;
  schema_version: string;
  org_name: string;
  registered_at: Date;
  approved_regions: string[];
  approved_zones: string[];
  contact_email: string;
  password_hash?: string | null;
};

type OrgCreate = Optional<
  OrgAttrs,
  "schema_version" | "approved_regions" | "approved_zones" | "password_hash"
>;

export class Org extends Model<OrgAttrs, OrgCreate> implements OrgAttrs {
  declare org_id: string;
  declare token: string;
  declare schema_version: string;
  declare org_name: string;
  declare registered_at: Date;
  declare approved_regions: string[];
  declare approved_zones: string[];
  declare contact_email: string;
  declare password_hash?: string | null;
}

Org.init(
  {
    org_id: { type: DataTypes.STRING(64), allowNull: false, primaryKey: true },
    token: { type: DataTypes.STRING(128), allowNull: false, unique: true },
    schema_version: { type: DataTypes.STRING(16), allowNull: false, defaultValue: "1" },
    org_name: { type: DataTypes.STRING(255), allowNull: false },
    registered_at: { type: DataTypes.DATE, allowNull: false },
    approved_regions: { type: DataTypes.JSON, allowNull: false, defaultValue: [] },
    approved_zones: { type: DataTypes.JSON, allowNull: false, defaultValue: [] },
    contact_email: { type: DataTypes.STRING(255), allowNull: false },
    password_hash: { type: DataTypes.STRING(255), allowNull: true },
  },
  { sequelize, tableName: "orgs", underscored: true }
);
