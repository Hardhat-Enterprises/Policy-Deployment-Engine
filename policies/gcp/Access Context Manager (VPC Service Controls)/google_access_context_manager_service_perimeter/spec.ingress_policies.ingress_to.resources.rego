package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.spec_ingress_policies_ingress_to_resources

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Ingress policies should target explicitly selected resources instead of allowing access to all resources within the Service Perimeter.",
    "remedies": ["Configure spec.ingress_policies.ingress_to.resources with specific project resources instead of '*'."],
  },
  {
    "condition": "Ingress resource targets must not allow all resources.",
    "attribute_path": ["spec", "ingress_policies", "ingress_to", "resources"],
    "values": ["*"],
    "policy_type": "blacklist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
