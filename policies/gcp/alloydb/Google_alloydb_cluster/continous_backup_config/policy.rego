package terraform.gcp.security.alloydb.google_alloydb_cluster.continuous_backup_config

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_cluster.vars as vars

conditions := [[
  {
    "situation_description": "Continuous backup must be enabled.",
    "remedies": ["Set continuous_backup_config.enabled = true."],
  },
  {
    "condition": "enabled must be true.",
    "attribute_path": ["continuous_backup_config", "enabled"],
    "values": [true],
    "policy_type": "whitelist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
