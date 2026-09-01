package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_agent.advanced_settings_logging_settings_enable_consent_based_redaction

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_agent.vars

conditions := [[
  {
    "situation_description": "Conversation logs must support consent-based end-user input redaction.",
    "remedies": ["Set advanced_settings.logging_settings.enable_consent_based_redaction to true."],
  },
  {
    "condition": "Consent-based redaction must be enabled.",
    "attribute_path": ["advanced_settings", 0, "logging_settings", 0, "enable_consent_based_redaction"],
    "values": [true],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
