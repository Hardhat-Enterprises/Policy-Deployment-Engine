package terraform.gcp.security.dataproc.google_dataproc_batch.environment_config_execution_config_subnetwork_uri

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_batch.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Batch does not explicitly specify a subnetwork for workload execution.",
            "remedies": [
                "Configure a subnetwork URI for the Dataproc Batch workload."
            ]
        },
        {
            "condition": "A subnetwork URI must be configured.",
            "attribute_path": ["environment_config", 0, "execution_config", 0, "subnetwork_uri"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
