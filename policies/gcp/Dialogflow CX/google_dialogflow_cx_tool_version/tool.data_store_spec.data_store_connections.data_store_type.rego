package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.tool_data_store_spec_data_store_connections_data_store_type

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.vars as vars

conditions := [[
  {
    "situation_description": "Dialogflow CX data store connection uses an unspecified data store type.",
    "remedies": ["Set data_store_type to an explicit supported value such as UNSTRUCTURED."],
  },
  {
    "condition": "data_store_type must not be DATA_STORE_TYPE_UNSPECIFIED.",
    "attribute_path": ["tool", 0, "data_store_spec", 0, "data_store_connections", 0, "data_store_type"],
    "values": ["DATA_STORE_TYPE_UNSPECIFIED"],
    "policy_type": "blacklist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details