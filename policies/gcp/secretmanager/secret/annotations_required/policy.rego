package terraform.gcp.security.secretmanager.secret.annotations_required
import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret.vars

conditions := [
  [
    {
      "situation_description": "Secret is missing required annotations for traceability",
      "remedies": [
        "Add required annotations like 'created_by' and 'env' to the resource"
      ]
    },
    {
      "condition": "Enforce required annotation keys",
      "attribute_path": ["annotations"],
      "values": [["created_by", "env"]],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
