package terraform.gcp.security.os_config.google_os_config_os_policy_assignment.os_policies_resource_groups_resources_file_file_allow_insecure
import data.terraform.helpers
import data.terraform.gcp.security.os_config.google_os_config_os_policy_assignment.vars

conditions := [
    [
    {"situation_description" : "OS Config OS policy assignment allows insecure fetching of the managed file's source.",
    "remedies":["Set allow_insecure to false so the managed file's source is integrity-verified (a remote checksum or Cloud Storage generation number is required)."]},
    {
        "condition": "allow_insecure must not be enabled.",
        "attribute_path" : ["os_policies", 0, "resource_groups", 0, "resources", 0, "file", 0, "file", 0, "allow_insecure"],
        "values" : [true],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
