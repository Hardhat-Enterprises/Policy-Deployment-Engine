package terraform.gcp.security.alloydb.google_alloydb_instance.network_config_public_ip_disabled

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars as vars

conditions := [[
  {
    "situation_description": "Public IP must be disabled on the AlloyDB instance.",
    "remedies": ["Set network_config.enable_public_ip = false."],
  },
  {
    "condition": "Public IP must be disabled.",
    "attribute_path": ["network_config", 0, "enable_public_ip"],
    "values": [false],
    "policy_type": "whitelist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
