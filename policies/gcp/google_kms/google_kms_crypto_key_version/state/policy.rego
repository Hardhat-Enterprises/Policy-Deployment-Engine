package terraform.gcp.security.google_kms.google_kms_crypto_key_version.state
import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key_version.vars

attribute_path := "state"

allowed_state := ["ENABLED"]


# Generate a summary which includes total resource count and non-compliant details.
summary := helpers.get_summary( vars.resource_type, attribute_path, allowed_state, vars.friendly_resource_name)
