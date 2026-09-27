package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_flow.advanced_settings_logging_settings_enable_interaction_logging

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_flow.vars as vars

conditions := [[
    {
        "situation_description": "Dialogflow CX interaction logging is disabled.",
        "remedies": [
            "Set advanced_settings.logging_settings.enable_interaction_logging = true."
        ],
    },
    {
        "condition": "Interaction logging must be enabled.",
        "attribute_path": [
            "advanced_settings",
            0,
            "logging_settings",
            0,
            "enable_interaction_logging"
        ],
        "values": [true],
        "policy_type": "whitelist",
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
