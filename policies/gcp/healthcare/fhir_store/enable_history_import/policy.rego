package terraform.gcp.security.healthcare.fhir_store.enable_history_import # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.fhir_store.vars

attribute_path := "enable_history_import"
compliant_values := false

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)