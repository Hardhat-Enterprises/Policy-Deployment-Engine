package terraform.gcp.security.oracle_db.exadata.deletion_protection # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.oracle_db.exadata.vars

attribute_path := "deletion_protection" # Edit here (eg., "storage_class")
compliant_values := true

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)