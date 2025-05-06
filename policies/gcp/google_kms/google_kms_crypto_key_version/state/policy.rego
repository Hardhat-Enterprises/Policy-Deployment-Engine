package terraform.gcp.security.google_kms.google_kms_crypto_key_version.state
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key_version.vars

situation :=[
  [
    {
      "situation_description": "Key version is not enabled",
      "remedies": ["Ensure key version state is set to ENABLED"]},
    {
      "condition": "Key version must be ENABLED",
      "attribute_path": ["state"],
      "values": ["ENABLED"],
      "policy_type": "whitelist"
    }
  ]

]

summary := helpers.get_multi_summary(situation, vars.variables)
message := summary.message

