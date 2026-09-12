package terraform.gcp.security.dataproc.google_dataproc_session_template.environment_config_execution_config_subnetwork_uri

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_session_template.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Session Template does not specify a controlled subnetwork for workload execution.",
            "remedies": [
                "Configure an approved subnetwork for workload execution."
            ]
        },
        {
            "condition": "A subnetwork must be configured.",
            "attribute_path": ["environment_config", 0, "execution_config", 0, "subnetwork_uri"],
            "values": ["", null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
