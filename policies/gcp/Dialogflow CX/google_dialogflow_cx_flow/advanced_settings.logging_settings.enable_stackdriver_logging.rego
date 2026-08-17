package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_flow.advanced_settings_logging_settings_enable_stackdriver_logging

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_flow.vars as vars

conditions := [[
    {
        "situation_description": "Google Cloud Logging is disabled for the Dialogflow CX Flow.",
        "remedies": [
            "Set advanced_settings.logging_settings.enable_stackdriver_logging = true."
        ],
    },
    {
        "condition": "Google Cloud Logging must be enabled.",
        "attribute_path": [
            "advanced_settings",
            0,
            "logging_settings",
            0,
            "enable_stackdriver_logging"
        ],
        "values": [true],
        "policy_type": "whitelist",
    },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
