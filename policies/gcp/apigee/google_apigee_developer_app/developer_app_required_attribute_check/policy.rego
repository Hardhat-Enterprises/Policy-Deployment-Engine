package terraform.gcp.security.apigee.google_apigee_developer_app.developer_app_required_attribute_check
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_developer_app.vars

# Required attribute
required_attribute_keys := [
  "name",
  "callback_url",
  "org_id",
  "developer_email"
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