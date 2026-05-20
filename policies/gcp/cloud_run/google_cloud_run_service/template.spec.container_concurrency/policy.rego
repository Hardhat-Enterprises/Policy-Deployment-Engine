package terraform.gcp.security.cloud_run.google_cloud_run_service.template.spec.container_concurrency

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service has container concurrency outside the approved range",
      "remedies": [
        "Set container_concurrency within the approved range of 1 to 80",
        "Avoid very high concurrency values that can impact performance and stability"
      ]
    },
    {
      "condition": "Container concurrency must be within the approved range",
      "attribute_path": ["template", 0, "spec", 0, "container_concurrency"],
      "values": [1, 80],
      "policy_type": "range"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

