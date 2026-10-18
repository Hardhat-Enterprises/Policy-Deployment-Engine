package terraform.gcp.security.dataproc.google_dataproc_session_template.environment_config_execution_config_staging_bucket

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_session_template.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Session Template does not specify a staging bucket for workload data and dependencies.",
            "remedies": [
                "Configure a dedicated Cloud Storage staging bucket."
            ]
        },
        {
            "condition": "A staging bucket must be configured.",
            "attribute_path": ["environment_config", 0, "execution_config", 0, "staging_bucket"],
            "values": ["", null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
