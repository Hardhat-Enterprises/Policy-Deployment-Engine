import { Org } from "./org.js";
import { Package } from "./package.js";

Org.hasMany(Package, { foreignKey: "org_id", sourceKey: "org_id" });
Package.belongsTo(Org, { foreignKey: "org_id", targetKey: "org_id" });

export { Org, Package };
