package terraform.gcp.security.alloydb.google_alloydb_user.user_id

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_user.vars as vars

conditions := [
  [
    {
      "situation_description": "AlloyDB user must have a non-empty user_id.",
      "remedies": ["Set user_id to a non-empty value that follows org standards."]
    },
    {
      "condition": "user_id must be provided.",
      "attribute_path": ["user_id"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Reserved or privileged usernames are not allowed.",
      "remedies": ["Choose a non-privileged username (e.g., team/project prefix).", "Avoid reserved names like postgres, root, admin."]
    },
    {
      "condition": "user_id must not be a reserved name.",
      "attribute_path": ["user_id"],
      "values": ["postgres", "root", "admin"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
