package terraform.gcp.security.os_config.google_os_config_os_policy_assignment.os_policies_resource_groups_resources_repository_zypper_base_url
import data.terraform.helpers
import data.terraform.gcp.security.os_config.google_os_config_os_policy_assignment.vars

conditions := [
    [
    {"situation_description" : "OS Config OS policy assignment fetches the Zypper repository over an insecure (non-HTTPS) URL.",
    "remedies":["Use an https:// URL so the Zypper repository is retrieved over an authenticated, tamper-resistant channel."]},
    {
        "condition": "URL scheme must be https.",
        "attribute_path" : ["os_policies", 0, "resource_groups", 0, "resources", 0, "repository", 0, "zypper", 0, "base_url"],
        "values" : ["*://", [["https"]]],
        "policy_type" : "pattern whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
