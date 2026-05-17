package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.spec.certificate_mode
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars



conditions := [
  [
    {
      "situation_description": "Cloud Run domain mapping certificate mode is not automatic",
      "remedies": [
        "Set certificate_mode to AUTOMATIC",
        "Avoid using NONE for certificate mode"
      ]
    },
    {
      "condition": "Certificate mode must be AUTOMATIC",
      "attribute_path": ["spec", 0, "certificate_mode"],
      "values": ["AUTOMATIC"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details


