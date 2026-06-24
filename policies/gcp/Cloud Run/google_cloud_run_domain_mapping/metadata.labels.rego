package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.metadata.labels
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars



conditions := [
  [
    {
      "situation_description": "Cloud Run domain mapping is missing required environment label or uses an invalid value",
      "remedies": [
        "Add a label 'env' to the resource",
        "Use one of the approved values: prod, dev, test"
      ]
    },
    {
      "condition": "Environment label must be one of the approved values",
      "attribute_path": ["metadata", 0, "labels", "env"],
      "values": ["prod", "dev", "test"],
      "policy_type": "whitelist"
    }
  ]
]
    


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details


