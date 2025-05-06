package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.image

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run v2 Job is using a container image from an unapproved registry.",
      "remedies": [
        "Use only container images from 'gcr.io/my-org/'.",
        "For example: gcr.io/my-org/secure-app:v1.2.3"
      ]
    },
    {
      "condition": "Image is not from 'gcr.io/my-org/'",
      "attribute_path": ["template", "template", "containers", 0, "image"],
      "values": ["gcr.io/my-org/secure-app:v1.2.3"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Cloud Run v2 Job is using an image with the ':latest' tag.",
      "remedies": [
        "Avoid using the ':latest' tag.",
        "Use pinned version tags like ':v1.2.3' to ensure consistency and security."
      ]
    },
    {
      "condition": "Image uses the disallowed ':latest' tag",
      "attribute_path": ["template", "template", "containers", 0, "image"],
      "values": ["docker.io/library/nginx:latest"],
      "policy_type": "blacklist"
    }
  ]
]

# Summary message output
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
