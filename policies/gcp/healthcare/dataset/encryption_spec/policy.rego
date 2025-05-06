package terraform.gcp.security.healthcare.dataset.encryption_spec
import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.dataset.vars

attribute_path := "encryption_spec.kms_key_name" 
compliant_values := "projects/project/locations/australia-southeast1/keyRings/my-keyring/cryptoKeys/my-encryption-key"

summary := helpers.get_summary(
    vars.resource_type,
    attribute_path,
    ["non-empty KMS key"],
    vars.friendly_resource_name
)