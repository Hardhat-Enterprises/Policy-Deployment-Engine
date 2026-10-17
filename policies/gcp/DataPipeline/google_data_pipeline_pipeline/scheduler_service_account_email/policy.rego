package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.scheduler_service_account_email

import data.terraform.helpers
import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars

conditions := [
    [
        {
            "situation_description": "If the scheduler_service_account_email attribute does not use an approved email format, security risks may arise from using unauthorised service accounts.",
            "remedies": ["Use only approved scheduler service account email formats."]
        },
        {
            "condition": "Check if scheduler_service_account_email follows the approved email pattern",
            "attribute_path": ["scheduler_service_account_email"],
            "values": ["*@*", [["Employee","companyname.com"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details