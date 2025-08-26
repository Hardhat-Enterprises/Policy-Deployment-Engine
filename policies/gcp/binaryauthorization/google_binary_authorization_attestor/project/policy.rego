package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.project

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.vars

conditions := [

  [
    {
      "situation_description": "Attestor does not have an explicit project set",
      "remedies": [
        "Add the `project` attribute to the google_binary_authorization_attestor resource"
      ]
    },
    {
      "condition": "Project attribute must be set explicitly",
      "attribute_path": ["project"],
      "values": [null, "test-project"],   # disallow missing or empty project
      "policy_type": "blacklist"
    }
  ]

]

# General summary message
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed per-resource breakdown
details := helpers.get_multi_summary(conditions, vars.variables).details
