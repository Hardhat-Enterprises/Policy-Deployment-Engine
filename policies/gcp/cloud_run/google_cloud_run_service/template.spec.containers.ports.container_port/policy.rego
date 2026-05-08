package terraform.gcp.security.cloud_run.google_cloud_run_service.template.spec.containers.ports.container_port

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service uses an unapproved container port",
      "remedies": [
        "Use the approved container port",
        "Set container_port to 8080"
      ]
    },
    {
      "condition": "Container port must use the approved Cloud Run port",
      "attribute_path": ["template", 0, "spec", 0, "containers", 0, "ports", 0, "container_port"],
      "values": [8080],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details