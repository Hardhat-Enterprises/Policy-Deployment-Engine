package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.workload_dataflow_flex_template_request_launch_parameter_environment_worker_region

import data.terraform.helpers
import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars

conditions := [[
    {
        "situation_description": "If the worker_region attribute is configured with an unapproved region, pipeline worker resources may process data in locations that violate data sovereignty, compliance, or organisational governance requirements.",
        "remedies": ["Configure the worker_region attribute with an approved worker region."],
    },
    {
        "condition": "check if the worker_region attribute uses an approved region",
        "attribute_path": ["workload", 0, "dataflow_flex_template_request", 0, "launch_parameter", 0, "environment", 0, "worker_region"],
        "values": ["australia-southeast1"],
        "policy_type": "whitelist"
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
