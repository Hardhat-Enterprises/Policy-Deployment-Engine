package terraform.gcp.security.google_kms.google_kms_crypto_key.destroy
import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key.vars

attribute_path := "destroy_scheduled_duration"

# Define the allowed value for destroy_scheduled_duration (30 days in seconds)
allowed_destroy_duration := ["2592000s"]

# Generate violation messages for non-compliant crypto keys.
violations[violation] if{
  resource := helpers.get_nc_resources("google_kms_crypto_key", attribute_path, allowed_destroy_duration)[_]
  violation := sprintf(
    "%s '%s' has an incorrect destroy scheduled duration: '%s'. Expected value: %v.",
    [vars.friendly_resource_name, resource.values.name, resource.values.destroy_scheduled_duration, allowed_destroy_duration]
  )
}

# Generate a summary which includes total count and non-compliant details.
summary := helpers.get_summary("google_kms_crypto_key", attribute_path, allowed_destroy_duration, vars.friendly_resource_name)
