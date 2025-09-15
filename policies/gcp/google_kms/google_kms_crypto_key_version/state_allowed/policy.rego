package terraform.gcp.security.google_kms.google_kms_crypto_key_version.state_allowed
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key_version.vars

conditions :=[
  
    [
    {
      "situation_description": "Key version is not enabled",
      "remedies": ["Ensure key version state is set to ENABLED"]
    },

    {
      "condition": "Key version must be ENABLED",
      "attribute_path": ["state"],
      "values": ["DISABLED"],
      "policy_type": "blacklist"
    }
   ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

