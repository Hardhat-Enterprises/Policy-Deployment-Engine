package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_flow.deletion_policy

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_flow.vars as vars

conditions := [[
    {
        "situation_description": "Dialogflow CX Flow is not protected from deletion.",
        "remedies": [
            "Set deletion_policy = PREVENT to protect the Dialogflow CX Flow from accidental deletion."
        ],
    },
    {
        "condition": "Deletion policy must prevent resource deletion.",
        "attribute_path": ["deletion_policy"],
        "values": ["PREVENT"],
        "policy_type": "whitelist",
    },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
