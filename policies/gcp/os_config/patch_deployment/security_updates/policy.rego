package terraform.gcp.security.os_config.patch_deployment.security_updates
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config.patch_deployment.security_updates.vars

# This policy ensures that patch deployments include security updates
# to maintain the security posture of systems

conditions := [
    [
    {"situation_description" : "Windows patch deployment does not include security updates",
    "remedies":[ "Add SECURITY to the windows_update classifications"]},
    {
        "condition": "Check if Windows patches include security updates",
        "attribute_path" : ["patch_config", "windows_update", "classifications"],
        "values" : ["SECURITY"],
        "policy_type" : "whitelist"
    }
    ],
    [
    {"situation_description" : "Linux Yum patches must have security enabled",
    "remedies":[ "Set security = true in the yum configuration"]},
    {
        "condition": "Check if yum security is enabled",
        "attribute_path" : ["patch_config", "yum", "security"],
        "values" : [true],
        "policy_type" : "whitelist"
    }
    ],
    [
    {"situation_description" : "Linux Zypper patches must include security category",
    "remedies":[ "Add 'security' to the zypper categories list"]},
    {
        "condition": "Check if zypper includes security category",
        "attribute_path" : ["patch_config", "zypper", "categories"],
        "values" : ["security"],
        "policy_type" : "whitelist"
    }
    ],
    [
    {"situation_description" : "Patch configuration must be defined",
    "remedies":[ "Add a patch_config block to the patch deployment configuration"]},
    {
        "condition": "Check if patch_config is defined",
        "attribute_path" : ["patch_config"],
        "values" : [null],
        "policy_type" : "blacklist"
    }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
details := helpers.get_multi_summary(conditions, vars.variables).details