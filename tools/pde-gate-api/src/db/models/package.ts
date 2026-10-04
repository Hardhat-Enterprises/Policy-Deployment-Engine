import { DataTypes, Model, Optional } from "sequelize";
import { sequelize } from "../sequelize.js";

export type PackageAttrs = {
  id: number;
  org_id: string;
  package_id: string;
  name: string;
  description: string | null;
  platforms: string[];
  policy_groups: Record<string, string[]>;
  variables: Record<string, unknown> | null;
  package_updated_at: Date;
};

type PackageCreate = Optional<
  PackageAttrs,
  "id" | "description" | "variables" | "platforms"
>;

export class Package extends Model<PackageAttrs, PackageCreate> implements PackageAttrs {
  declare id: number;
  declare org_id: string;
  declare package_id: string;
  declare name: string;
  declare description: string | null;
  declare platforms: string[];
  declare policy_groups: Record<string, string[]>;
  declare variables: Record<string, unknown> | null;
  declare package_updated_at: Date;
}

Package.init(
  {
    id: { type: DataTypes.INTEGER.UNSIGNED, autoIncrement: true, primaryKey: true },
    org_id: { type: DataTypes.STRING(64), allowNull: false },
    package_id: { type: DataTypes.STRING(64), allowNull: false },
    name: { type: DataTypes.STRING(255), allowNull: false },
    description: { type: DataTypes.TEXT, allowNull: true },
    platforms: { type: DataTypes.JSON, allowNull: false, defaultValue: ["gcp"] },
    policy_groups: { type: DataTypes.JSON, allowNull: false, defaultValue: {} },
    variables: { type: DataTypes.JSON, allowNull: true },
    package_updated_at: { type: DataTypes.DATE, allowNull: false },
  },
  { sequelize, tableName: "packages", underscored: true }
);
