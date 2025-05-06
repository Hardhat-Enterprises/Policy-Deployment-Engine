package terraform.gcp.security.healthcare.consent_store.enable_consent_create_on_update
import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.consent_store.vars

attribute_path := "enable_consent_create_on_update"
compliant_values := true

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)