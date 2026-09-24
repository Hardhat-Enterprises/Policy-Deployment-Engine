package terraform.gcp.security.dataproc.google_dataproc_session_template.environment_config_execution_config_network_tags

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_session_template.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Session Template does not specify network tags for network traffic control.",
            "remedies": [
                "Configure appropriate network tags for the workload."
            ]
        },
        {
            "condition": "Network tags must be configured.",
            "attribute_path": ["environment_config", 0, "execution_config", 0, "network_tags"],
            "values": [null, []],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
