package terraform.gcp.security.os_config.resource_tagging
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config.resource_tagging.vars

# This policy ensures that OS Config resources have proper tags or labels
# to enable better resource management, cost allocation, and security governance

conditions := [
    [
    {"situation_description" : "OS Config resources must have a description",
    "remedies":[ "Add a descriptive 'description' field to the resource"]},
    {
        "condition": "Check if description is defined and not empty",
        "attribute_path" : ["description"],
        "values" : [""],
        "policy_type" : "blacklist"
    }
    ],
    [
    {"situation_description" : "OS Config resources must have a valid patch_deployment_id format",
    "remedies":[ "Ensure the patch_deployment_id follows the format 'env-purpose-id' (e.g., 'prod-security-001')"]},
    {
        "condition": "Check if patch_deployment_id follows required pattern",
        "attribute_path" : ["patch_deployment_id"],
        "values" : ["[a-z]+-[a-z]+-[0-9]+"],
        "policy_type" : "pattern whitelist"
    }
    ],
    [
    {"situation_description" : "OS Config resources must have a project specified",
    "remedies":[ "Add a project field to the resource configuration"]},
    {
        "condition": "Check if project is defined",
        "attribute_path" : ["project"],
        "values" : [null],
        "policy_type" : "blacklist"
    }
    ],
    [
    {"situation_description" : "OS Config resources must not use default project",
    "remedies":[ "Specify explicit project instead of using default"]},
    {
        "condition": "Check if project is not using default project",
        "attribute_path" : ["project"],
        "values" : ["default"],
        "policy_type" : "blacklist"
    }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
details := helpers.get_multi_summary(conditions, vars.variables).details