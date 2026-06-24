package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.workload_dataflow_flex_template_request_launch_parameter_environment_num_workers

import data.terraform.helpers
import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars

conditions := [[
    {
        "situation_description": "If the num_workers attribute is configured outside the approved range, excessive compute usage, unstable pipeline performance, or unexpected cloud costs may occur",
        "remedies": ["Configure the num_workers attribute within the approved worker range"],
    },
    {
        "condition": "check if the num_workers attribute is within the approved range",
        "attribute_path": ["workload", 0, "dataflow_flex_template_request", 0, "launch_parameter", 0, "environment", 0, "num_workers"],
        "values": [1, 20],
        "policy_type": "range"
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
