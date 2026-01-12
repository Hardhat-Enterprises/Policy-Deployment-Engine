package terraform.gcp.security.apigee.google_apigee_developer.apigee_developer_email_validation
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_developer.vars

# Required attribute
required_attribute_keys := [
  "email"
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
            "situation_description": "email should be compliant",
            "remedies": [
                "Ensure email should is compliant"
            ]
        },
        {
            "condition": "check email should is compliant",

            # Correct nested attribute path
            "attribute_path": ["email"],

            # Allow only org names that match this pattern
            "values": ["john.doe@deakin.edu.au"],   # unable to use regex based validation *@deakin.edu.au; using hardcoded method

            "policy_type": "whitelist"
        }
    ]
]

conditions := array.concat(presence_conditions, value_conditions)

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details