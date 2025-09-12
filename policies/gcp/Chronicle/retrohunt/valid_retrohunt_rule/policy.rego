package terraform.gcp.security.chronicle.retrohunt.valid_retrohunt_rule

import data.terraform.gcp.helpers
import data.terraform.gcp.security.chronicle.retrohunt.vars

conditions := [[
  {
    "situation_description": "Retrohunt rule is missing or empty, which means the retrohunt will not run properly.",
    "remedies": ["Provide a valid retrohunt rule when creating a retrohunt."],
  },
  {
    "condition": "Ensure retrohunt rule is not empty",
    "attribute_path": "rule",
    "values": [""],                
    "policy_type": "blacklist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
