package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_flow.advanced_settings_logging_settings_enable_consent_based_redaction

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_flow.vars as vars

conditions := [[
    {
        "situation_description": "Consent-based redaction is disabled for the Dialogflow CX Flow.",
        "remedies": [
            "Set advanced_settings.logging_settings.enable_consent_based_redaction = true."
        ],
    },
    {
        "condition": "Consent-based redaction must be enabled.",
        "attribute_path": [
            "advanced_settings",
            0,
            "logging_settings",
            0,
            "enable_consent_based_redaction"
        ],
        "values": [true],
        "policy_type": "whitelist",
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
