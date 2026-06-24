package terraform.gcp.security.cloud_run.google_cloud_run_service.metadata_namespace

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service metadata namespace does not match the approved project",
      "remedies": [
        "Set namespace to the approved project ID",
        "Use my-gcp-project as the metadata namespace"
      ]
    },
    {
      "condition": "Metadata namespace must match the approved project",
      "attribute_path": ["metadata", 0, "namespace"],
      "values": ["my-gcp-project"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

