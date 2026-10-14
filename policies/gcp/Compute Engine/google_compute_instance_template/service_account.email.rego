package terraform.gcp.security.compute_engine.google_compute_instance_template.service_account_email

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template does not run as a dedicated user-managed service account. When service_account.email is left out, instances fall back to the default Compute Engine service account (PROJECT_NUMBER-compute@developer.gserviceaccount.com), which is broadly privileged, so any compromise of the instance inherits more access than the workload needs.",
            "match": "any",
            "remedies": [
                "Set service_account.email to a dedicated, least-privilege user-managed service account (an address ending in .iam.gserviceaccount.com).",
                "Grant that service account only the roles the workload actually requires."
            ]
        },
        {
            "condition": "Check that service_account.email is set",
            "attribute_path": ["service_account", 0, "email"],
            "values": [null, ""],
            "policy_type": "blacklist"
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
