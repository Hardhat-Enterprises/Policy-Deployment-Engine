package terraform.gcp.security.os_config.google_os_config_os_policy_assignment.os_policies_resource_groups_resources_repository_yum_gpg_keys
import data.terraform.helpers
import data.terraform.gcp.security.os_config.google_os_config_os_policy_assignment.vars

conditions := [
    [
    {"situation_description" : "OS Config OS policy assignment configures a YUM repository with no signing keys.",
    "remedies":["Provide at least one gpg_keys URI so package signatures can be verified."]},
    {
        "condition": "Value must be present and non-empty.",
        "attribute_path" : ["os_policies", 0, "resource_groups", 0, "resources", 0, "repository", 0, "yum", 0, "gpg_keys"],
        "values" : [[]],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
