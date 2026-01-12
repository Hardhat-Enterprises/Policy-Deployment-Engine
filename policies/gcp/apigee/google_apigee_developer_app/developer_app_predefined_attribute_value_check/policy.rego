package terraform.gcp.security.apigee.google_apigee_developer_app.developer_app_predefined_attribute_value_check
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_developer_app.vars


# Optional allow-lists for selected keys
allowed_values := {
  "org_id" : ["PDE-Apigee-Org"],
  "callback_url": ["https://example-call.url"],
  "status": ["approved", "revoked"]
}


# Build value allow-list checks where defined
conditions := [
  [
    {
      "situation_description": sprintf("Invalid value for security label %s", [k]),
      "remedies": [sprintf("Set labels.%s to one of: %v", [k, allowed_values[k]])]
    },
    {
      "condition": sprintf("labels.%s must be in allow-list", [k]),
      "attribute_path": [k],
      "policy_type": "whitelist",
      "values": allowed_values[k]
    }
  ] |
    k := {"org_id", "callback_url", "status"}[_]
]



result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details