package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.http_target

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

conditions := [

    # Insecure HTTP
    [
        {
            "situation_description": "HTTP target is using insecure HTTP protocol",
            "remedies": [
                "Use HTTPS instead of HTTP",
                "Set uri_override.scheme to HTTPS"
            ]
        },
        {
            "condition": "Checks if HTTP is used instead of HTTPS",
            "attribute_path": ["http_target", "uri_override", "scheme"],
            "values": ["HTTP"],
            "policy_type": "blacklist"
        }
    ],

    # Unsafe HTTP method (GET)
    [
        {
            "situation_description": "HTTP method is GET, which ignores request body and may expose data in URL",
            "remedies": [
                "Use POST instead of GET",
                "Ensure sensitive data is sent in request body"
            ]
        },
        {
            "condition": "Checks if HTTP method is GET",
            "attribute_path": ["http_target", "http_method"],
            "values": ["GET"],
            "policy_type": "blacklist"
        }
    ],

    # Missing authentication
    [
        {
            "situation_description": "HTTP target has no authentication configured",
            "remedies": [
                "Configure OIDC or OAuth authentication",
                "Avoid unauthenticated endpoints"
            ]
        },
        {
            "condition": "Checks if OIDC authentication is missing",
            "attribute_path": ["http_target", "oidc_token"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],

    # Missing service account
    [
        {
            "situation_description": "OIDC token is configured without a service account",
            "remedies": [
                "Specify service_account_email in oidc_token",
                "Ensure proper identity is used"
            ]
        },
        {
            "condition": "Checks if service_account_email is missing",
            "attribute_path": ["http_target", "oidc_token", "service_account_email"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details