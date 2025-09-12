package terraform.gcp.security.firebase.google_firebase_web_app_config.auth_domain

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.google_firebase_web_app_config.vars

conditions := [
  [
    {"situation_description": "Firebase auth_domain should be whitelisted",
     "remedies": ["Change auth_domain to a compliant domain"]},
    {
      "condition": "auth_domain check",
      "attribute_path": ["auth_domain"],
      "values": ["ankita-firebase-web-app.firebaseapp.com"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
