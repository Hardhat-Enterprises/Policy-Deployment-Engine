package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.workload_dataflow_flex_template_request_launch_parameter_environment_worker_zone

import data.terraform.helpers
import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars

conditions := [[
    {
        "situation_description": "If the worker_zone attribute is configured with an unapproved availability zone, pipeline worker resources may process data in locations that violate data sovereignty, compliance, or organisational governance requirements.",
        "remedies": ["Configure the worker_zone attribute with an approved availability zone."],
    },
    {
        "condition": "check if the worker_zone attribute uses an approved availability zone",
        "attribute_path": ["workload", 0, "dataflow_flex_template_request", 0, "launch_parameter", 0, "environment", 0, "worker_zone"],
        "values": ["australia-southeast1-a"],
        "policy_type": "whitelist"
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
