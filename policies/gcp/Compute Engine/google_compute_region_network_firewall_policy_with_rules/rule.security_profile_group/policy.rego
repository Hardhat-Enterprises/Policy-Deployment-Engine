package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.rule_security_profile_group
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.vars as vars


conditions := [
  [
    {
      "situation_description": "Firewall rules applying a security profile group must reference a centrally managed group by its fully-qualified URL.",
      "remedies": [
        "Set security_profile_group to the full networksecurity.googleapis.com URL of a security profile group, not a bare name",
        "Reference a securityProfileGroups resource - a securityProfiles reference is a different resource and is not accepted here",
        "tls_inspect must be set to true so that encrypted payloads can be inspected."
      ]
    },
    {
      "condition": "security_profile_group must be a fully-qualified securityProfileGroups URL",
      "attribute_path": ["rule", 0, "security_profile_group"],
      "values": [
        "https://networksecurity.googleapis.com/v1/projects/[^/]+/locations/[^/]+/*/[^/]+",
        [["securityProfileGroups"]]
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]


result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
