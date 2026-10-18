package terraform.gcp.security.vertex_ai.google_vertex_ai_index_endpoint_deployed_index.enable_access_logging

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_index_endpoint_deployed_index.vars

conditions := [
    [
        {
            "situation_description": "The deployed index does not send access logs to Cloud Logging. Access to the private endpoint is then not recorded and cannot be audited.",
            "remedies": [
                "Set 'enable_access_logging' to true so private endpoint access logs go to Cloud Logging."
            ]
        },
        {
            "condition": "Check that access logging is turned on",
            "attribute_path": ["enable_access_logging"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details