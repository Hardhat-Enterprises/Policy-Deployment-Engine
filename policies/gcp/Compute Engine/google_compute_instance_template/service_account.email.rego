package terraform.gcp.security.compute_engine.google_compute_instance_template.service_account_email

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template runs as the default Compute Engine service account (PROJECT_NUMBER-compute@developer.gserviceaccount.com) instead of a dedicated user-managed service account. The default account is broadly privileged, so any compromise of the instance inherits more access than the workload needs.",
            "remedies": [
                "Set service_account.email to a dedicated, least-privilege user-managed service account (an address ending in .iam.gserviceaccount.com).",
                "Grant that service account only the roles the workload actually requires."
            ]
        },
        {
            "condition": "Check that service_account.email is a user-managed service account",
            "attribute_path": ["service_account", 0, "email"],
            "values": ["*@*.iam.gserviceaccount.com"],
            "policy_type": "element pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details