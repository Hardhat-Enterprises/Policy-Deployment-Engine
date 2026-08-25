package terraform.gcp.security.dialogflow.google_dialogflow_generator.location
import data.terraform.helpers

import data.terraform.gcp.security.dialogflow.google_dialogflow_generator.vars

#location check

conditions := [
    [
    {
        "situation_description": "Is location set to australia?",
        "remedies": ["Ensure that it is set to australian locations"]
        },
      {
        "condition": "location is not configured properly",
        "attribute_path": ["location"],
        "values": ["australia_southeast1","australia_southeast2"],
        "policy_type": "whitelist"
      }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
