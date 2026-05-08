package terraform.gcp.security.cloud_run.google_cloud_run_service.template.spec.containers.image

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service container image is not from an approved registry path",
      "remedies": [
        "Use an approved Artifact Registry image path",
        "Use image paths beginning with us-docker.pkg.dev/cloudrun/container/"
      ]
    },
    {
      "condition": "Container image must match the approved registry pattern",
      "attribute_path": ["template", 0, "spec", 0, "containers", 0, "image"],
      "values": [
        "*.*.*/*/*/*",
        [["us-docker"], ["pkg"], ["dev"], ["cloudrun"], ["container"], ["hello"]]
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details