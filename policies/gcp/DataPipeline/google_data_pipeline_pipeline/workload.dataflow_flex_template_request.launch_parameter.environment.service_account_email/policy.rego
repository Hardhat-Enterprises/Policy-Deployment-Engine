package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.workload_dataflow_flex_template_request_launch_parameter_environment_service_account_email

import data.terraform.helpers
import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars

conditions := [
    [
        {
            "situation_description": "If the service_account_email attribute does not use an approved service account domain, pipeline jobs may run with unauthorised or externally managed identities.",
            "remedies": ["Use only approved Google Cloud service account email formats."]
        },
        {
            "condition": "Check if service_account_email follows the approved email pattern",
            "attribute_path": ["workload", 0, "dataflow_flex_template_request", 0, "launch_parameter", 0, "environment", 0, "service_account_email"],
            "values": ["*@*", [["pipeline_sa", "orginisationemail.com"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
