package terraform.gcp.security.compute_engine.google_compute_region_instance_template.service_account_scopes

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The regional instance template uses an overly broad OAuth scope for its service account, increasing the permissions available to the workload.",
            "remedies": [
                "Replace the cloud-platform scope with narrower service-specific OAuth scopes.",
                "Grant only the scopes required by the workload.",
                "Review the service account IAM permissions together with its OAuth scopes."
            ]
        },
        {
            "condition": "Service account scopes must not contain unrestricted cloud-platform access.",
            "attribute_path": ["service_account", 0, "scopes"],
            "values": [
                "cloud-platform",
                "https://www.googleapis.com/auth/cloud-platform"
            ],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
