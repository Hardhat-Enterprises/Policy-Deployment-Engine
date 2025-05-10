package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.no_default_service_account

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.no_default_service_account.vars

# Enforce use of custom service accounts, not the default App Engine SA
# The default App Engine SA usually follows the format: PROJECT_ID@appspot.gserviceaccount.com

conditions := [
  [
    {"situation_description" : "Default App Engine service account is used",
     "remedies": [ 
        "Create and assign a custom service account with limited roles",
        "Avoid using PROJECT_ID@appspot.gserviceaccount.com"
     ]},
    {
      "condition": "Disallow use of default App Engine service account",
      "attribute_path": ["service_account"],
      "values": ["@appspot.gserviceaccount.com"],
      "policy_type": "pattern blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
