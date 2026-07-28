package terraform.gcp.security.cloud_run.google_cloud_run_service.metadata_labels

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service metadata label does not use an approved environment value",
      "remedies": [
        "Add an env label to the resource",
        "Use one of the approved env values: prod, dev, or test"
      ]
    },
    {
      "condition": "Metadata env label must use an approved value",
      "attribute_path": ["metadata", 0, "labels", "env"],
      "values": ["prod", "dev", "test"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

