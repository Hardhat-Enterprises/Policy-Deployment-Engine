package terraform.gcp.security.healthcare.fhir_store.enable_update_create # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.fhir_store.vars

attribute_path := "enable_update_create"
compliant_values := false
summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)