package terraform.gcp.security.compute_engine.google_compute_instance_template.service_account_scopes

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance's service account is granted the broad, legacy 'cloud-platform' OAuth scope (or another scope) instead of following Google's documented least-privilege pattern",
            "remedies": ["Set service_account.scopes to a list containing only ['cloud-platform'], and manage granular permissions via IAM roles on a dedicated service account instead of legacy access scopes"]
        },
        {
            "condition": "service_account.scopes must be exactly ['https://www.googleapis.com/auth/cloud-platform']",
            "attribute_path": ["service_account", 0, "scopes"],
            "values": ["https://www.googleapis.com/auth/cloud-platform"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details