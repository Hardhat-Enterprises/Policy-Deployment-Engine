package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.bypass_temp_dir_validation

import data.terraform.helpers
import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars

conditions := [
    [
        {
            "situation_description": "If the bypass_temp_dir_validation attribute is enabled, temporary storage locations may bypass validation checks, potentially allowing insecure or misconfigured storage paths to be used.",
            "remedies": ["Disable bypass_temp_dir_validation to ensure temporary directory validation is enforced."            ]
        },
        {
            "condition": "Check if bypass_temp_dir_validation is disabled",
            "attribute_path": [
            "workload", 0, "dataflow_flex_template_request", 0, "launch_parameter", 0, "environment", 0, "bypass_temp_dir_validation"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details