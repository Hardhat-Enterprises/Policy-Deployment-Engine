package terraform.gcp.security.compute_engine.google_compute_region_instance_template.confidential_instance_config_enable_confidential_compute

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_instance_template.vars

conditions := [
    [
        {
            "situation_description": "Confidential Compute is not enabled on the regional instance template, reducing protection for data in use.",
            "remedies": [
                "Set confidential_instance_config.enable_confidential_compute to true.",
                "Enable Confidential Compute for workloads requiring stronger memory protection.",
                "Review the instance template confidential-computing configuration."
            ]
        },
        {
            "condition": "Check whether Confidential Compute is enabled.",
            "attribute_path": ["confidential_instance_config", 0, "enable_confidential_compute"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
