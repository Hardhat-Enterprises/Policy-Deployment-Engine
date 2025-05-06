package terraform.gcp.security.google_kms.google_kms_key_ring.location

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_key_ring.vars as vars

# === Compliance Parameters ===
allowed_locations         := ["us-central1"]
forbidden_name_keywords   := ["test"]


attribute_path := "location"


blacklist_violations := helpers.get_blacklist_violations(vars.resource_type , "name", forbidden_name_keywords, vars.friendly_resource_name)
region_violations := helpers.get_summary(vars.resource_type, "location", allowed_locations, vars.friendly_resource_name)

summary.message := array.concat(region_violations.message, blacklist_violations)
