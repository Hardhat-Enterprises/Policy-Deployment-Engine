package terraform.gcp.security.access_manager.service_perimeter.egress_policies

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_manager.service_perimeter.egress_policies.vars

conditions := [
  [
    {"situation_description" : "Egress policy allows public access or wildcard resource usage",
     "remedies": [ "Restrict identities and avoid wildcard '*' in resources" ]},
    {
      "condition": "Ensure egress_from.identities are organizational users and not public",
      "attribute_path" : ["egress_policies", 0, "egress_from", "identities", 0],
      "values" : ["@deakin.edu.au"],
      "policy_type" : "pattern whitelist"
    }
  ],
  [
    {"situation_description" : "Egress policy uses wildcard '*' in resources",
     "remedies": [ "Specify exact project/resource instead of '*'" ]},
    {
      "condition": "Disallow wildcard resources in egress_to",
      "attribute_path" : ["egress_policies", 0, "egress_to", "resources", 0],
      "values" : ["*"],
      "policy_type" : "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details