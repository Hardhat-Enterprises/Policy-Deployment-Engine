package terraform.gcp.security.dataform.google_dataform_repository.git_https_secret

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {
      "situation_description": "HTTPS Git auth secret version must not be null.",
      "remedies": [
        "Populate authentication_token_secret_version with a valid Secret Manager version.",
        "Ensure the secret exists and is accessible."
      ]
    },
    {
      "condition": "Secret version must not be null",
      "attribute_path": ["git_remote_settings", 0, "authentication_token_secret_version"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "HTTPS Git auth secret version must not be empty.",
      "remedies": [
        "Populate authentication_token_secret_version with a valid Secret Manager version.",
        "Ensure the secret exists and is accessible."
      ]
    },
    {
      "condition": "Secret version must not be empty",
      "attribute_path": ["git_remote_settings", 0, "authentication_token_secret_version"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "HTTPS Git auth must reference a valid Secret Manager version.",
      "remedies": [
        "Point authentication_token_secret_version to projects/*/secrets/*/versions/*.",
        "Rotate the secret per org policy."
      ]
    },
    {
      "condition": "Secret version must match Secret Manager format",
      "attribute_path": ["git_remote_settings", 0, "authentication_token_secret_version"],
      "values": ["projects/*/secrets/*/versions/*", [["*"], ["*"], ["*"]]],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
