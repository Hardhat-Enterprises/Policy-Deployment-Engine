package terraform.gcp.security.os_config.google_os_config_os_policy_assignment.os_policies_resource_groups_resources_repository_goo_url
import data.terraform.helpers
import data.terraform.gcp.security.os_config.google_os_config_os_policy_assignment.vars

conditions := [
    [
    {"situation_description" : "OS Config OS policy assignment fetches the GooGet repository over an insecure (non-HTTPS) URL.",
    "remedies":["Use an https:// URL so the GooGet repository is retrieved over an authenticated, tamper-resistant channel."]},
    {
        "condition": "URL scheme must be https.",
        "attribute_path" : ["os_policies", 0, "resource_groups", 0, "resources", 0, "repository", 0, "goo", 0, "url"],
        "values" : ["*://", [["https"]]],
        "policy_type" : "pattern whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message

details := result.details
