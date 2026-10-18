package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.tool_open_api_spec_tls_config_ca_certs_cert

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.vars as vars

conditions := [[
  {
    "situation_description": "Dialogflow CX Tool Version custom TLS CA configuration must include certificate material.",
    "remedies": ["Provide a non-empty CA certificate for HTTPS verification."],
  },
  {
    "condition": "ca_certs.cert must not be empty.",
    "attribute_path": ["tool", 0, "open_api_spec", 0, "tls_config", 0, "ca_certs", 0, "cert"],
    "values": [""],
    "policy_type": "blacklist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
