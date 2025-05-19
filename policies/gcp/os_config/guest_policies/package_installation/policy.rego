package terraform.gcp.security.os_config.guest_policies.package_installation
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config.guest_policies.vars

# This policy ensures that guest policies have proper package installation configurations
# to ensure security and compliance of installed packages

conditions := [
    [
        {
            "situation_description" : "Guest policy does not have package resources defined",
            "remedies":[ "Define package resources in the guest policy to manage software installations"]
        },
        {
            "condition": "Check if package_repositories is defined",
            "attribute_path" : ["package_repositories"],
            "values" : [[]],
            "policy_type" : "blacklist"
        }
    ],
    [
    {
        "situation_description" : "Guest policy allows installation of packages from insecure sources",
        "remedies":[ "Ensure all package installations use secure repositories or verified sources"]
    },
        {
            "condition": "Check if package repositories are secure",
            "attribute_path" : ["package_repositories", 0, "apt", 0, "uri"],
            "values" : ["https://packages.cloud.google.com/apt"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details