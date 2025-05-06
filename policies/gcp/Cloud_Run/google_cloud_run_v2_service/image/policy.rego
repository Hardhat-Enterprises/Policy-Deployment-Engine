package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.image

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vars

conditions := [
  [
    {
      "situation_description": "Container image uses ':latest' tag.",
      "remedies": [
        "Use a specific image tag like ':1.0.0' instead of ':latest'.",
        "This improves reproducibility and avoids unexpected changes."
      ]
    },
    {
      "condition": "Reject images that exactly match ':latest' tag",
      "attribute_path": ["template", "containers", 0, "image"],
      "values": ["gcr.io/my-project/my-image:latest"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
