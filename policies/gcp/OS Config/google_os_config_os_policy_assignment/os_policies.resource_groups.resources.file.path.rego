package terraform.gcp.security.os_config.google_os_config_os_policy_assignment.os_policies_resource_groups_resources_file_path
import data.terraform.helpers
import data.terraform.gcp.security.os_config.google_os_config_os_policy_assignment.vars

conditions := [
    [
    {"situation_description" : "OS Config OS policy assignment writes a managed file outside an approved directory.",
    "remedies":["Write managed files under an approved top-level directory (e.g. /etc, /opt) to avoid sensitive locations."]},
    {
        "condition": "Destination path must be under an approved top-level directory.",
        "attribute_path" : ["os_policies", 0, "resource_groups", 0, "resources", 0, "file", 0, "path"],
        "values" : ["/*", [["etc", "opt", "var", "usr"]]],
        "policy_type" : "pattern whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
