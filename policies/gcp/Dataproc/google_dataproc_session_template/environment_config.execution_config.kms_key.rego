package terraform.gcp.security.dataproc.google_dataproc_session_template.environment_config_execution_config_kms_key

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_session_template.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Session Template does not specify a Cloud KMS key for workload encryption.",
            "remedies": [
                "Configure a valid Cloud KMS key for workload encryption.",
            ]
        },
        {
            "condition": "A Cloud KMS key must be configured.",
            "attribute_path": ["environment_config", 0, "execution_config", 0, "kms_key"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
