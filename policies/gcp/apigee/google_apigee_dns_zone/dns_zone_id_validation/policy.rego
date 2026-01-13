package terraform.gcp.security.apigee.google_apigee_dns_zone.dns_zone_id_validation
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_dns_zone.vars

# Required attribute
required_attribute_keys := [
  "dns_zone_id"
]


# Build the presence checks (non-empty)
conditions := [
  [
    {
      "situation_description": sprintf("Missing or empty required attribute: %s", [k]),
      "remedies": [sprintf("Set attribute.%s to a non-empty value.", [k])]
    },
    {
      "condition": sprintf("attribute.%s must be set", [k]),
      "attribute_path": [k],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ] |
    k := required_attribute_keys[_]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details