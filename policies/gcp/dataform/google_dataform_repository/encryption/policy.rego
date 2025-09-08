package terraform.gcp.security.dataform.google_dataform_repository.encryption
import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {
      "situation_description": "Dataform repository must use customer-managed encryption key (CMEK).",
      "remedies": ["Set kms_key_name to a valid CMEK path matching the repository region."]
    },
    {
      "condition": "kms_key_name must be set (non-empty)",
      "attribute_path": ["kms_key_name"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details






