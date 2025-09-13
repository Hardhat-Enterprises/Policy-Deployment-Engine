package terraform.gcp.security.chronicle.data_access_scope.secure_data_access_scope_configuration

import data.terraform.gcp.helpers
import data.terraform.gcp.security.chronicle.data_access_scope.vars

conditions := [

  [
    {
      "situation_description": "Data_access_scope is configured with allow_all=true which grants unrestricted access.",
      "remedies": [
        "Avoid using allow_all = true unless explicitly required and documented.",
        "Use allowed_data_access_labels to restrict access to specific log types, labels, or namespaces.",
        "If allow_all is necessary, combine it with denied_data_access_labels to restrict risky datasets."
      ]
    },
    {
      "condition": "allow_all set to true",
      "attribute_path": ["allow_all"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ],

  
  [
    {
      "situation_description": "Data_access_scope has neither allow_all = true or allowed_data_access_labels defined.",
      "remedies": [
        "Define at least one allowed_data_access_labels (log_type, data_access_label or ingestion_label).",
        "Remove or update invalid or empty scope definitions.",
        "Ensure that access is restricted through specific labels instead of relying on defaults."
      ]
    },
    {
      "condition": "No allow_all and no allowed_data_access_labels defined",
      "attribute_path": ["allowed_data_access_labels"],
      "values": [[], null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
