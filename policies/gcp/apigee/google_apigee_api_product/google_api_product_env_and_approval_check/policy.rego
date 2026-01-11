package terraform.gcp.security.apigee.google_apigee_api_product.google_api_product_env_and_approval_check
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_api_product.vars



# Allow-lists for selected keys
allowed_values := {
  "environments" : ["Production", "Staging", "QA", "Development"],
  "approval_type" : ["manual", "auto"]
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
    k := {"environments", "approval_type"}[_]
]

conditions := value_conditions

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details