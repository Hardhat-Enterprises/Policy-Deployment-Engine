package terraform.gcp.security.storage.bucket.force_destroy
import data.terraform.gcp.helpers
import data.terraform.gcp.security.storage.bucket.vars

attribute_path := "force_destroy"
compliant_values := false

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)