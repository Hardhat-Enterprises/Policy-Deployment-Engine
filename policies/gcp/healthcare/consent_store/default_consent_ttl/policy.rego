package terraform.gcp.security.healthcare.consent_store.default_consent_ttl # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.consent_store.vars

attribute_path := "default_consent_ttl"
compliant_values := [
    "86400s"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)