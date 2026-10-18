package terraform.gcp.security.Container_Azure.google_container_azure_cluster.authorization_admin_users_username

import data.terraform.helpers
import data.terraform.gcp.security.Container_Azure.google_container_azure_cluster.vars

conditions := [[
    {
        "situation_description": "If the authorization.admin_users.username attribute uses a reserved unauthorized administrator identifier, an unintended account may be granted administrative access to the cluster.",
        "remedies": ["Use a valid administrator username that identifies only an intended cluster administrator."],
    },
    {
        "condition": "Check that the admin_users username does not use the reserved unauthorized administrator naming pattern.",
        "attribute_path": ["authorization", 0, "admin_users", 0, "username"],
        "values": [
            "UNAUTHORIZED-*-USER",
            [["ADMIN"]],
        ],
        "policy_type": "pattern blacklist",
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details