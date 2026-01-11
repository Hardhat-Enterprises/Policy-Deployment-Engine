package terraform.gcp.security.apigee.google_apigee_app_group.app_group_status_check
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_app_group.vars



# Allow-lists for selected keys
allowed_values := {
  "status" : ["active", "inactive"]
}


# Build value allow-list checks where defined
value_conditions := [
  [
    {
      "situation_description": sprintf("Invalid value for attribute %s", [k]),
      "remedies": [sprintf("Set attribute.%s to one of: %v", [k, allowed_values[k]])]
    },
    {
      "condition": sprintf("attribute.%s must be in allow-list", [k]),
      "attribute_path": [k],
      "policy_type": "whitelist",
      "values": allowed_values[k]
    }
  ] |
    k := {"status"}[_]
]

conditions := value_conditions

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details