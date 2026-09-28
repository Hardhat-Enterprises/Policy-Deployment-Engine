package terraform.gcp.security.eventarc.google_eventarc_pipeline.destinations_authentication_config_google_oidc_service_account

import data.terraform.helpers
import data.terraform.gcp.security.eventarc.google_eventarc_pipeline.vars

conditions := [
    [
        {
            "situation_description": "A default Google-managed service account is being used to generate OIDC tokens for the destination request.",
            "remedies": [
                "Use a dedicated, intentionally selected service account for the Pipeline's OIDC authentication.",
                "Grant the service account only the IAM roles required by the destination."
            ]
        },
        {
            "condition": "OIDC service_account must not use a default Google-managed service account.",
            "attribute_path": ["destinations", 0, "authentication_config", 0, "google_oidc", 0, "service_account"],
            "values": ["@*", [["developer.gserviceaccount.com", "appspot.gserviceaccount.com"]]],
            "policy_type": "pattern blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
