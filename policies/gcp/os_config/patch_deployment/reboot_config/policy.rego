package terraform.gcp.security.os_config.patch_deployment.reboot_config
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config.patch_deployment.reboot_config.vars

# This policy ensures that patch deployments have a proper reboot configuration
# to maintain system stability and predictable behavior during patching operations

conditions := [
    [
    {"situation_description" : "Production systems should use NEVER or DEFAULT for reboot_config",
    "remedies":[ "Set reboot_config to NEVER or DEFAULT for production environments"]},
    {
        "condition": "Check if production environments avoid ALWAYS reboot",
        "attribute_path" : ["patch_deployment_id", "patch_config", "reboot_config"],
        "values" : ["prod-.*-.*", "ALWAYS"],
        "policy_type" : "pattern blacklist"
    }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
details := helpers.get_multi_summary(conditions, vars.variables).details