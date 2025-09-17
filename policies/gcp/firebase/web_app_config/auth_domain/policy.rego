package terraform.gcp.security.firebase.web_app_config.auth_domain

import data.terraform.gcp.helpers

conditions := [
  [
    {
      "situation_description": "Firebase web app config auth domain is not set to the approved domain.",
      "remedies": [
        "Set auth_domain to 'ankita-firebase-web-app.firebaseapp.com'"
      ]
    },
    {
      "attribute_path": ["auth_domain"],
      "condition": "Auth domain must be 'ankita-firebase-web-app.firebaseapp.com'",
      "policy_type": "whitelist",
      "values": ["ankita-firebase-web-app.firebaseapp.com"]
    }
  ]
]

message := helpers.get_multi_summary(conditions, variables).message
details := helpers.get_multi_summary(conditions, variables).details
