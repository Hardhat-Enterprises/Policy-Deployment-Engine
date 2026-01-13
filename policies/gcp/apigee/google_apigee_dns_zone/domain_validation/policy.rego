package terraform.gcp.security.apigee.google_apigee_dns_zone.domain_validation
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_dns_zone.vars

# Required attribute
required_attribute_keys := [
  "domain"
]


# Build the presence checks (non-empty)
presence_conditions := [
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

# Build value allow-list checks where defined

value_conditions := [
    [
        {
            "situation_description": "domain should be compliant",
            "remedies": [
                "Ensure domain should is compliant"
            ]
        },
        {
            "condition": "check org_id should is compliant",

            # Correct nested attribute path
            "attribute_path": ["domain"],

            # Allow only org names that match this pattern
            "values": ["hardhat.deakin.edu.au"],

            "policy_type": "whitelist"
        }
    ]
]

conditions := array.concat(presence_conditions, value_conditions)

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details