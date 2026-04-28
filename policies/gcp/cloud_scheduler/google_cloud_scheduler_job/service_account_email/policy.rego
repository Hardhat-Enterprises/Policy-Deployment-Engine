package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.service_account_email

import data.terraform.helpers
import data.terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

conditions := [
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
summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
