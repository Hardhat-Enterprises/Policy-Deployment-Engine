package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.max_workers

import data.terraform.helpers
import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars

conditions := [[
    {
        "situation_description": "If the max_workers attribute is configured outside the approved range, uncontrolled autoscaling and excessive cloud costs may occur",
        "remedies": ["Configure the max_workers attribute within the approved worker range"],
    },
    {
        "condition": "check if the max_workers attribute is within the approved range",
        "attribute_path": ["workload", 0, "dataflow_flex_template_request", 0, "launch_parameter", 0, "environment", 0, "max_workers"],
        "values": [1, 50],
        "policy_type": "range"
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details