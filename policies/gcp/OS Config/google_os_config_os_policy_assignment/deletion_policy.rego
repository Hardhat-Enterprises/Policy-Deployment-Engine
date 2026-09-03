package terraform.gcp.security.os_config.google_os_config_os_policy_assignment.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.os_config.google_os_config_os_policy_assignment.vars

conditions := [
    [
    {"situation_description" : "OS Config OS policy assignment uses the ABANDON deletion policy.",
    "remedies":["Set deletion_policy to DELETE or PREVENT so the assignment stays under Terraform (IaC) management."]},
    {
        "condition": "Deletion policy must not be ABANDON.",
        "attribute_path" : ["deletion_policy"],
        "values" : ["ABANDON"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message

details := result.details
