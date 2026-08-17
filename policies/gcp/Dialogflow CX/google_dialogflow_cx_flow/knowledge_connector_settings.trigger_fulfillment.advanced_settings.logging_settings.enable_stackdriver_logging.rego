package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_flow.knowledge_connector_settings_trigger_fulfillment_advanced_settings_logging_settings_enable_stackdriver_logging

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_flow.vars as vars

conditions := [[
    {
        "situation_description": "Google Cloud Logging is disabled for the Dialogflow CX knowledge connector fulfillment.",
        "remedies": [
            "Set knowledge_connector_settings.trigger_fulfillment.advanced_settings.logging_settings.enable_stackdriver_logging = true."
        ],
    },
    {
        "condition": "Google Cloud Logging must be enabled for knowledge connector fulfillment.",
        "attribute_path": [
            "knowledge_connector_settings",
            0,
            "trigger_fulfillment",
            0,
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
