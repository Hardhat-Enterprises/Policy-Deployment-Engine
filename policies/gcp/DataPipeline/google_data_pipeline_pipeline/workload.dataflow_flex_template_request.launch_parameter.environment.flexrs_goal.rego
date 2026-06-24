package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.workload_dataflow_flex_template_request_launch_parameter_environment_flexrs_goal

import data.terraform.helpers
import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars

conditions := [[
    {
        "situation_description": "If the flexrs_goal attribute is configured with an unapproved FlexRS optimisation mode, pipeline execution may not follow organisational cost optimisation or operational efficiency requirements.",
        "remedies": ["Configure the flexrs_goal attribute with an approved FlexRS optimisation setting."],
    },
    {
        "condition": "check if the flexrs_goal attribute uses an approved FlexRS optimisation mode",
        "attribute_path": ["workload", 0, "dataflow_flex_template_request", 0, "launch_parameter", 0, "environment", 0, "flexrs_goal"],
        "values": ["FLEXRS_COST_OPTIMIZED"],
        "policy_type": "whitelist"
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
