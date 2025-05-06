package terraform.gcp.security.google_kms.google_kms_crypto_key_iam_binding.role
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key_iam_binding.vars

attribute_path := "role"

# Define the allowed role value.
allowed_role := ["roles/cloudkms.cryptoKeyEncrypterDecrypter"]


# Generate a summary including total resource count and non-compliant details.
summary := helpers.get_summary("google_kms_crypto_key_iam_binding", attribute_path, allowed_role, vars.friendly_resource_name)
