package terraform.gcp.security.google_kms.google_kms_key_ring_import_job.protection_level
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_key_ring_import_job.vars as vars

conditions := [

    [ 
    {
      "situation_description": "Unsupported protection level",
      "remedies": ["Use protection_level = HSM or SOFTWARE"]
    },
    {
      "condition": "Allowed protection levels",
      "attribute_path": ["protection_level"],
      "values": ["HSM", "SOFTWARE"],
      "policy_type": "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
