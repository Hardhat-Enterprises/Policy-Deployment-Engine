package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.spec_force_override
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars



conditions := [
  [
    {
      "situation_description": "Cloud Run domain mapping uses force_override which may override existing mappings",
      "remedies": [
        "Remove force_override unless absolutely necessary",
        "Avoid setting force_override to true to prevent accidental overrides"
      ]
    },
    {
      "condition": "force_override must not be true",
      "attribute_path": ["spec", 0, "force_override"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details


