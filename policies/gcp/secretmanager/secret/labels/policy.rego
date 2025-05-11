package terraform.gcp.security.secretmanager.secret.labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret.vars

conditions := [
  [
    {"situation_description": "Secret is missing labels",
     "remedies": ["Add at least one label to every secret"]},
    {
      "condition": "Secret must have at least one label",
      "attribute_path": ["labels"],
      "values": [""],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
