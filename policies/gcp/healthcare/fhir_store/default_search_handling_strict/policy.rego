package terraform.gcp.security.healthcare.fhir_store.default_search_handling_strict # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.fhir_store.vars

attribute_path := "default_search_handling_strict"
compliant_values := true

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)