package terraform.gcp.security.containeraws.google_container_aws_cluster.authorization_admin_users_username

import data.terraform.helpers
import data.terraform.gcp.security.containeraws.google_container_aws_cluster.vars

conditions := [[
  {
    "situation_description": "Cluster admin access is assigned to an unapproved admin user.",
    "remedies": ["Use an approved organisation-managed user identity such as user@deakin.edu.au."],
  },
  {
    "condition": "admin_users username must use an approved organisation-managed email address",
    "attribute_path": ["authorization", 0, "admin_users", 0, "username"],
    "values": ["*@*", [["user"], ["deakin.edu.au"]]],
    "policy_type": "pattern whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
