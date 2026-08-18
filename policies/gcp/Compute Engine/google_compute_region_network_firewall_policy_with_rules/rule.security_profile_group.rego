package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.rule_security_profile_group
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.vars as vars


conditions := [
  [
    {
      "situation_description": "Firewall rules applying a security profile group must reference a centrally managed, approved group.",
      "remedies": [
        "Reference a security profile group from the approved central security project",
        "Never point a security profile group created from the workloads own proejct",
        "tls_inspect must be set to true so that encrypted payloads can be inspected."
      ]
    },
    {
      "condition": "Security profile group must be one of the approved centrally managed groups",
      "attribute_path": ["rule", 0, "security_profile_group"],
      "values": [
        "https://networksecurity.googleapis.com/v1/projects/APPROVED_SECURITY_PROJECT/locations/global/securityProfileGroups/standard-threat-prevention",
        "https://networksecurity.googleapis.com/v1/projects/APPROVED_SECURITY_PROJECT/locations/global/securityProfileGroups/strict-threat-prevention"
      ],
      "policy_type": "whitelist"
    }
  ]
]

   
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

