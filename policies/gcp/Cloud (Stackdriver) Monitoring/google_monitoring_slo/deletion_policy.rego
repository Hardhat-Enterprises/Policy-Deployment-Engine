package terraform.gcp.security.cloud_stackdriver_monitoring.google_monitoring_slo.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.cloud_stackdriver_monitoring.google_monitoring_slo.vars

conditions := [
    [
        {
            "situation_description": "The Monitoring SLO is not protected from deletion.",
            "remedies": [
                "Set deletion_policy to PREVENT to protect the SLO from accidental deletion."
            ]
        },
        {
            "condition": "Deletion policy must be PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
