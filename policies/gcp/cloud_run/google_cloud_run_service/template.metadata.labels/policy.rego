package terraform.gcp.security.cloud_run.google_cloud_run_service.template.metadata.labels

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service template label does not use an approved environment value",
      "remedies": [
        "Use approved environment labels such as prod, dev, or test"
      ]
    },
    {
      "condition": "Template label env must be approved",
      "attribute_path": ["template", 0, "metadata", 0, "labels", "env"],
      "values": ["prod", "dev", "test"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details