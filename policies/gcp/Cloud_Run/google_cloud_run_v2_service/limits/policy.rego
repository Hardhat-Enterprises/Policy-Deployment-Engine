package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.limits

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vars

conditions := [
  [
    {
      "situation_description": "Container CPU limit is below 500m.",
      "remedies": [
        "Set CPU limit to at least 500m (0.5 vCPU)."
      ]
    },
    {
      "condition": "CPU under 500m",
      "attribute_path": ["template", "containers", 0, "resources", "limits", "cpu"],
      "values": ["500m", null],  # Minimum = 500m, No upper bound
      "policy_type": "range"
    }
  ],
  [
    {
      "situation_description": "Container memory limit is below 256Mi.",
      "remedies": [
        "Set memory limit to at least 256Mi."
      ]
    },
    {
      "condition": "Memory under 256Mi",
      "attribute_path": ["template", "containers", 0, "resources", "limits", "memory"],
      "values": ["256Mi", null],  # Minimum = 256Mi, No upper bound
      "policy_type": "range"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
