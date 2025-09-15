package terraform.gcp.security.firebase.web_app_config.auth_domain

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.web_app_config.vars

conditions := [
  [
    {
      "situation_description": "Firebase web app config has missing or invalid auth domain",
      "remedies": [
        "Configure auth_domain to end with '.firebaseapp.com'",
        "Ensure auth_domain is properly set in Firebase web app configuration"
      ]
    },
    {
      "attribute_path": ["auth_domain"],
      "condition": "Auth domain must end with .firebaseapp.com",
      "policy_type": "regex",
      "values": [".*\\.firebaseapp\\.com$"]
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
