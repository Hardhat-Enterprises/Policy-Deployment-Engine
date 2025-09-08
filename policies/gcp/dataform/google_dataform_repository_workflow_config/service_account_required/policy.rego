package terraform.gcp.security.dataform.google_dataform_repository_workflow_config.service_account_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository_workflow_config.vars

conditions := [
    [
        {"situation_description" : "Workflow configs must define an invocation_config.service_account",
        "remedies": ["Set invocation_config.service_account to a valid service account email"]},
        {
            "condition": "service_account is required",
            "attribute_path" : ["invocation_config", "service_account"],
            "values" : ["*"],
            "policy_type" : "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details



