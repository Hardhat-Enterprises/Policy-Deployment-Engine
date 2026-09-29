package terraform.gcp.security.compute_engine.google_compute_region_instance_template.service_account_email

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The regional instance template does not specify a service account email, allowing the default Compute Engine service account to be used.",
            "remedies": [
                "Configure an explicit service account email.",
                "Use a dedicated service account with only the permissions required by the workload.",
                "Review the instance template service account configuration."
            ]
        },
        {
            "condition": "Service account email is not specified.",
            "attribute_path": ["service_account", 0, "email"],
            "values": null,
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
