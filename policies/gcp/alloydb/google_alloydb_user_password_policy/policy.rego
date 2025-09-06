package terraform.gcp.security.alloydb.google_alloydb_user.password_policy
import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_user.vars

conditions := [
  [
    {
      "situation_description": "Built-in AlloyDB user has a weak password (must be ≥ 8 chars, include an uppercase letter and a special character).",
      "remedies": [
        "Set a stronger password that matches: ^(?=.*[A-Z])(?=.*[^A-Za-z0-9]).{8,}$"
      ]
    },
    {
      "condition": "applies to built-in users",
      "attribute_path": ["user_type"],
      "values": ["ALLOYDB_BUILT_IN"],
      "policy_type": "whitelist"
    },
    {
      "condition": "password must match complexity pattern",
      "attribute_path": ["password"],
      "values": ["^(?=.*[A-Z])(?=.*[^A-Za-z0-9]).{8,}$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
