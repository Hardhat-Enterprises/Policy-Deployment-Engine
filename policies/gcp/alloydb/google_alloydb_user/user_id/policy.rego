package terraform.gcp.security.alloydb.google_alloydb_user.user_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_user.vars

conditions := [
  [
    {
      "situation_description": "User ID is missing or empty.",
      "remedies": ["Set user_id to a non-empty value."]
    },
    {
      "condition": "user_id must be present and non-empty",
      "attribute_path": ["user_id"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "User ID is a risky or default username.",
      "remedies": ["Use a unique service-style ID such as svc_app_env."]
    },
    {
      "condition": "disallow common default usernames",
      "attribute_path": ["user_id"],
      "values": ["admin","root","postgres","test","temp","dev","user","reader","writer"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
