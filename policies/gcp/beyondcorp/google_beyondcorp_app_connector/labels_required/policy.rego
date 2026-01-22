package terraform.gcp.security.beyondcorp.google_beyondcorp_app_connector.labels_required

import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_connector.vars

conditions := [
  [
    {
      "situation_description": "The App Connector does not have the mandatory 'env' label assigned.",
      "remedies": [
        "Add a label 'env' to specify the environment of deplyment like (test, QA, Production, Sandbox) )."
      ]
    },
    {
      "condition": "Label 'env' must be present",
      "attribute_path": ["labels", "env"],
      "values": [""],
      "policy_type": "blocklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
                   