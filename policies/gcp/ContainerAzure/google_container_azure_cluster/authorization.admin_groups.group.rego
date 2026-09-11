package terraform.gcp.security.Container_Azure.google_container_azure_cluster.authorization_admin_groups_group

import data.terraform.helpers
import data.terraform.gcp.security.Container_Azure.google_container_azure_cluster.vars

conditions := [[
    {
        "situation_description": "If the authorization.admin_groups.group attribute uses a broad administrative group identifier, unintended users may receive cluster-admin privileges.",
        "remedies": ["Use a specific administrative group identifier containing only the intended cluster administrators."],
    },
    {
        "condition": "Check that the admin_groups group does not use the broad all-admins naming pattern.",
        "attribute_path": ["authorization", 0, "admin_groups", 0, "group"],
        "values": [
            "*-admins@*",
            [["all"], []],
        ],
        "policy_type": "pattern blacklist",
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details