package terraform.gcp.security.google_kms.google_kms_key_ring_import_job.protection_level
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_key_ring_import_job.protection_level.vars as vars

conditions := [

  # Situation 1: Only HSM or EXTERNAL protection levels allowed
  [
    {
      "situation_description": "Unsupported protection level",
      "remedies": ["Use protection_level = HSM or EXTERNAL"]
    },
    {
      "condition": "Allowed protection levels",
      "attribute_path": ["protection_level"],
      "values": ["HSM", "EXTERNAL"],
      "policy_type": "whitelist"
    }
  ],

]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message

