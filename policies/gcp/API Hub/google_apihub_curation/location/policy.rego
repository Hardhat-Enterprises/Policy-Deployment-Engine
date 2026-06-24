package terraform.gcp.security.api_hub.google_apihub_curation.location

import data.terraform.helpers
import data.terraform.gcp.security.api_hub.google_apihub_curation.vars

conditions := [[
  {
    "situation_description": "Location must be australia-southeast1 (Melbourne) and australia-southeast2 (Sydney).",
    "remedies": ["Set google_apihub_curation.location to \"australia-southeast1\"."]
  },
  {
    "condition": "Location is not australia-southeast1",
    "attribute_path": ["location"],
    "values": ["australia-southeast1"],
    "policy_type": "whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details