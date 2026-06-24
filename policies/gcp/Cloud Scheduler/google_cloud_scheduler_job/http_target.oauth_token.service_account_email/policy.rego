package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.http_target_oauth_token_service_account_email

import data.terraform.helpers
import data.terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

# Merged policy for `http_target.oauth_token.service_account_email` — 2 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
conditions := [
[
        {
            "situation_description": "Oauth_token is not implented",
            "remedies": ["Please use and configure an Oauth_token to be used with a service_account_email that is associated with the current project"]
        },
        {
            "condition": "Oauth_token must be configured and used",
            "attribute_path": ["http_target", 0, "oauth_token", 0, "service_account_email"],
            "values": [null, ""],
            "policy_type": "blacklist"
        },
    ],
[
        {
            "situation_description": "Oauth_token is using the overly priviledged default service account",
            "remedies": ["Please use and configure an Oauth_token to be used with a service_account_email that is associated with the current project"]
        },
        {
            "condition": "Disallows the use of the compute default account",
            "attribute_path": ["http_target", 0, "oauth_token", 0, "service_account_email"],
            "values": ["-*", [["compute@developer.gserviceaccount.com"]]],
            "policy_type": "pattern blacklist"
        }
    ],
    [
        {
            "situation_description": "Oauth_token is using the overly priviledged default app engine account",
            "remedies": ["Please use and configure an Oauth_token to be used with a service_account_email that is associated with the current project"]
        },
        {
            "condition": "disallows default app engine service accounts",
            "attribute_path": ["http_target", 0, "oauth_token", 0, "service_account_email"],
            "values": ["@*", [["appspot.gserviceaccount.com"]]],
            "policy_type": "pattern blacklist"
        }
    ],
    [
        {
            "situation_description": "Oidc_token is using an overly priviledged default compute service account",
            "remedies": ["Please use and configure an Oidc_token to be used with a service_account_email that is associated with the current project"]
        },
        {
            "condition": "Oidc_token disallows default compute service accounts",
            "attribute_path": ["http_target", 0, "oidc_token", 0, "service_account_email"],
            "values": ["-*", [["compute@developer.gserviceaccount.com"]]],
            "policy_type": "pattern blacklist"
        }
    ],
    [
        {
            "situation_description": "Oidc_token is using an overly priviledged default app engine service account",
            "remedies": ["Please use and configure an Oidc_token to be used with a service_account_email that is associated with the current project"]
        },
        {
            "condition": "disallows default app engine service accounts",
            "attribute_path": ["http_target", 0, "oidc_token", 0, "service_account_email"],
            "values": ["@*", [["appspot.gserviceaccount.com"]]],
            "policy_type": "pattern blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
