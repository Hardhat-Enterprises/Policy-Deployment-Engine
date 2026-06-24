package terraform.gcp.security.cloud_run.google_cloud_run_service.metadata.annotations

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

# Merged top-level `metadata.annotations`-scoped policy. Each element of
# `conditions` is an independent scenario evaluated on its own by
# helpers.get_multi_summary:
#   1. ingress                          - ingress must not be public
#   2. binary-authorization-breakglass  - breakglass override must not be enabled
#   3. custom-audiences                 - custom audiences must not use wildcard values
conditions := [
  [
    {
      "situation_description": "Cloud Run service allows public ingress",
      "remedies": [
        "Restrict ingress to internal only",
        "Use run.googleapis.com/ingress = internal"
      ]
    },
    {
      "condition": "Ingress must not be public",
      "attribute_path": ["metadata", 0, "annotations", "run.googleapis.com/ingress"],
      "values": ["internal"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Cloud Run service uses Binary Authorization breakglass override",
      "remedies": [
        "Disable Binary Authorization breakglass usage",
        "Remove run.googleapis.com/binary-authorization-breakglass annotation"
      ]
    },
    {
      "condition": "Binary Authorization breakglass must not be enabled",
      "attribute_path": ["metadata", 0, "annotations", "run.googleapis.com/binary-authorization-breakglass"],
      "values": [""],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Cloud Run service uses unapproved custom audiences",
      "remedies": [
        "Use approved custom audiences only",
        "Avoid wildcard custom audience values"
      ]
    },
    {
      "condition": "Custom audiences must not use wildcard values",
      "attribute_path": ["metadata", 0, "annotations", "run.googleapis.com/custom-audiences"],
      "values": ["*"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
