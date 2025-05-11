package terraform.gcp.security.identity_platform.default_supported_idp_config.idp_id_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_platform.default_supported_idp_config.vars

conditions := [
  [
    {
      "situation_description": "The specified idp_id is not in the approved list of identity providers.",
      "remedies": [
        "Use only supported IDPs such as google.com, github.com, facebook.com, etc."
      ]
    },
    {
      "condition": "Ensure idp_id is in the approved list",
      "attribute_path": ["idp_id"],
      "values": [
        "apple.com",
        "facebook.com",
        "gc.apple.com",
        "github.com",
        "google.com",
        "linkedin.com",
        "microsoft.com",
        "playgames.google.com",
        "twitter.com",
        "yahoo.com"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details