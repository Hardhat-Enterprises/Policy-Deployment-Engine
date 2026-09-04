package terraform.gcp.security.dialogflow.google_dialogflow_generator.deletion_policy
import data.terraform.helpers

import data.terraform.gcp.security.dialogflow.google_dialogflow_generator.vars

#location check

conditions := [
    [
    {
        "situation_description": "Generator deletion protection is not enabled.",
        "remedies": ["Set deletion_policy to PREVENT to prevent accidental destruction of the generator."]
        },
      {
        "condition": "Check that deletion_policy is set to PREVENT.",
        "attribute_path": ["deletion_policy"],
        "values": ["PREVENT"],
        "policy_type": "whitelist"
      }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
