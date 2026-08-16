package terraform.gcp.security.os_config.google_os_config_os_policy_assignment.os_policies_resource_groups_resources_repository_apt_gpg_key
import data.terraform.helpers
import data.terraform.gcp.security.os_config.google_os_config_os_policy_assignment.vars

conditions := [
    [
    {"situation_description" : "OS Config OS policy assignment configures an APT repository with a blank signing key.",
    "remedies":["Provide a non-empty gpg_key URI so package signatures can be verified."]},
    {
        "condition": "Value must be present and non-empty.",
        "attribute_path" : ["os_policies", 0, "resource_groups", 0, "resources", 0, "repository", 0, "apt", 0, "gpg_key"],
        "values" : [""],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
