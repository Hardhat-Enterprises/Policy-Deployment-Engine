package terraform.gcp.security.dataflow.google_dataflow_flex_template_job.ip_configuration

import data.terraform.helpers
import data.terraform.gcp.security.dataflow.google_dataflow_flex_template_job.vars

conditions := [
    [
        {
            "situation_description": "Dataflow Flex Template job workers are assigned public IP addresses, increasing attack surface.",
            "remedies": ["Set 'ip_configuration' to 'WORKER_IP_PRIVATE' to ensure workers use private IPs only."]
        },
        {
            "condition": "Check if workers use private IP configuration",
            "attribute_path": ["ip_configuration"],
            "values": ["WORKER_IP_PRIVATE", "WORKER_IP_PUBLIC"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details