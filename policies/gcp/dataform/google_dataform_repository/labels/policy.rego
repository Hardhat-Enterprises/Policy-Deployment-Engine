package terraform.gcp.security.dataform.google_dataform_repository.labels
import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {
      "situation_description": "Repository must include mandatory labels (environment, owner).",
      "remedies": ["Set labels.environment and labels.owner to non-empty values."]
    },
    {
      "condition": "effective_labels must exist",
      "attribute_path": ["effective_labels"],
      "policy_type": "pattern whitelist",
      "values": ["*"]
    },
    {
      "condition": "environment label must exist",
      "attribute_path": ["environment"],
      "values": ["", null],
      "policy_type": "blacklist"
    },
    {
      "condition": "owner label must exist",
      "attribute_path": ["owner"],
      "values": ["", null],
      "policy_type": "blacklist"
    },
    {
      "condition": "cost_center label must exist",
      "attribute_path": ["cost_center"],
      "values": ["", null],
      "policy_type": "blacklist"
    },
    {
      "condition": "team label must exist",
      "attribute_path": ["team"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


