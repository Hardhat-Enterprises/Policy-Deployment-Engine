package terraform.gcp.security.google_kms.google_kms_ekm_connection.location
import data.terraform.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_ekm_connection.vars as vars

conditions := [
    [
    {
      "situation_description": "EKM connection must live in an approved Australian region",
      "remedies": [
        "Use one of the approved Australia KMS regions: australia-southeast1 or australia-southeast2",
        "If you require another region, request it be whitelisted"
      ]
    },
    {
      "condition":      "Approved Australian regions only",
      "attribute_path": ["location"],
      "values":         ["australia-southeast1", "australia-southeast2"],
      "policy_type":    "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
