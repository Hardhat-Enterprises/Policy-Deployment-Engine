package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars

conditions := [[
    {
        "situation_description": "If the kms_key_name attribute is not configured, pipeline encryption protections may be weakened or absent",
        "remedies": ["Configure the kms_key_name attribute with an approved Cloud KMS key"],
    },
    {
    "condition": "check if the kms_key_name attribute is configured",
    "attribute_path": ["workload", 0, "dataflow_flex_template_request", 0, "launch_parameter", 0, "environment", 0, "kms_key_name"],
    "values": [
        "",
        null
    ],
    "policy_type": "blacklist",
},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details