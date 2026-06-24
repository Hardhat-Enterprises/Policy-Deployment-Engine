package terraform.gcp.security.cloud_run.google_cloud_run_service.template.spec.containers.env.value

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service contains sensitive plaintext environment variable values",
      "remedies": [
        "Avoid storing secrets or passwords directly in environment variables",
        "Use Secret Manager references instead of plaintext values"
      ]
    },
    {
      "condition": "Environment variable values must not contain sensitive plaintext data",
      "attribute_path": ["template", 0, "spec", 0, "containers", 0, "env", 0, "value"],
      "values": [
        "password",
        "secret",
        "token",
        "apikey",
        "key"
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

