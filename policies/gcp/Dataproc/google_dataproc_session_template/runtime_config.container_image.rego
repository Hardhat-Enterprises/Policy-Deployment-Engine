package terraform.gcp.security.dataproc.google_dataproc_session_template.runtime_config_container_image

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_session_template.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Session Template does not specify a controlled container image for the workload runtime.",
            "remedies": [
                "Configure an approved container image for the workload runtime."
            ]
        },
        {
            "condition": "A container image must be configured.",
            "attribute_path": ["runtime_config", 0, "container_image"],
            "values": ["", null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
