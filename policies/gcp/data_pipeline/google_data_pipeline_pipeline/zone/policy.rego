package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.zone

import data.terraform.helpers
import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars

conditions := [[
    {
        "situation_description": "If the zone attribute is configured with an unapproved availability zone, pipeline workers may be deployed in locations that violate data sovereignty, compliance, or organisational governance requirements",
        "remedies": [
            "Configure the zone attribute with an approved availability zone"
        ],
    },
    {
        "condition": "check if the zone attribute uses an approved availability zone",
        "attribute_path": ["workload", 0, "dataflow_flex_template_request", 0, "launch_parameter", 0, "environment", 0, "zone"],
        "values": ["australia-southeast1-a"],
        "policy_type": "whitelist"
    },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details