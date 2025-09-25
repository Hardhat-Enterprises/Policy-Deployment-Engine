package terraform.gcp.security.beyondcorp.google_beyondcorp_app_connector.service_account_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_connector.vars

conditions := [
  [
    {
      "situation_description": "AppConnector uses a non-approved service account.",
      "remedies": [
        "Use only approved service accounts: connector-a@<project>.iam.gserviceaccount.com, connector-b@<project>.iam.gserviceaccount.com."
      ]
    },
    {
      "condition": "Service account must be in the approved list.",
      "attribute_path": ["principal_info", 0 ,"service_account", 0 , "email"],
      "values": [
        "connector-a@my-proj.iam.gserviceaccount.com",
        "connector-b@my-proj.iam.gserviceaccount.com"
      ],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
