package terraform.gcp.security.apigee.google_apigee_app_group.app_group_org_and_name_check
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_app_group.vars

# Required attribute
required_attribute_keys := [
  "name",
  "display_name",
  "org_id"
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
            "situation_description": "org_id should be compliant",
            "remedies": [
                "Ensure org_id should is compliant"
            ]
        },
        {
            "condition": "check org_id should is compliant",

            # Correct nested attribute path
            "attribute_path": ["org_id"],

            # Allow only org names that match this pattern
            "values": ["PDE-Apigee-Org"],

            "policy_type": "whitelist"
        }
    ]
]

conditions := array.concat(presence_conditions, value_conditions)

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details