package terraform.gcp.security.os_config.google_os_config_os_policy_assignment.os_policies_resource_groups_resources_file_file_local_path
import data.terraform.helpers
import data.terraform.gcp.security.os_config.google_os_config_os_policy_assignment.vars

conditions := [
    [
    {"situation_description" : "OS Config OS policy assignment sources a local file from outside an approved directory.",
    "remedies":["Source local files from an approved directory (e.g. under /opt) to avoid sensitive-path inclusion."]},
    {
        "condition": "Local source path must be under an approved top-level directory.",
        "attribute_path" : ["os_policies", 0, "resource_groups", 0, "resources", 0, "file", 0, "file", 0, "local_path"],
        "values" : ["/*", [["opt"]]],
        "policy_type" : "pattern whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
