package terraform.gcp.security.alloydb.google_alloydb_user.user_id

import data.terraform.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_user.vars as vars

conditions := [
  [
    {
      "situation_description": "Reserved or privileged usernames are not allowed.",
      "remedies": [
        "Choose a non-privileged username (e.g., team/project prefix).",
        "Avoid reserved names like postgres, root, admin."
      ],
    },
    {
      "condition": "user_id must not be a reserved name.",
      "attribute_path": ["user_id"],
      "values": ["postgres", "root", "admin"],
      "policy_type": "blacklist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
