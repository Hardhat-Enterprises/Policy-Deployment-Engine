package terraform.gcp.security.google_kms.google_kms_crypto_key.rotation # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key.vars

attribute_path := "rotation_period" # Edit here 

# Define the allowed values for the 'purpose' attribute.
allowed_rotation_period := ["2592000s"]

# Generate violation messages for non-compliant crypto keys.
violations[violation] if {
  resource := helpers.get_nc_resources("google_kms_crypto_key", "rotation_period", allowed_rotation_period)[_]
  violation := sprintf(
    "Crypto Key '%s' has an incorrect rotation period: '%s'. Expected value: %v.",
    [resource.values.name, resource.values.rotation_period, allowed_rotation_period]
  )
}

# Generate a summary which includes total count and non-compliant details.
summary := helpers.get_summary("google_kms_crypto_key", "rotation_period", allowed_rotation_period, "Crypto Key")
