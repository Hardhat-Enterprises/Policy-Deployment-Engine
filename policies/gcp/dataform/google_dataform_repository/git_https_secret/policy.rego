package terraform.gcp.security.dataform.google_dataform_repository.git_https_secret

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {
      "situation_description": "Dataform repository must have authentication_token_secret_version for HTTPS authentication.",
      "remedies": [
        "Set authentication_token_secret_version for HTTPS authentication.",
        "Use Secret Manager for token storage."
      ]
    },
    {
      "condition": "authentication_token_secret_version must not be null",
      "attribute_path": ["authentication_token_secret_version"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository authentication_token_secret_version cannot be empty.",
      "remedies": [
        "Set authentication_token_secret_version to a non-empty value.",
        "Use valid Secret Manager version path."
      ]
    },
    {
      "condition": "authentication_token_secret_version must not be empty",
      "attribute_path": ["authentication_token_secret_version"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository authentication_token_secret_version must match Secret Manager format.",
      "remedies": [
        "Use format: projects/*/secrets/*/versions/*",
        "Ensure proper Secret Manager integration."
      ]
    },
    {
      "condition": "authentication_token_secret_version must match Secret Manager format",
      "attribute_path": ["authentication_token_secret_version"],
      "values": ["projects/*/secrets/*/versions/*", [["*"], ["*"], ["*"]]],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details