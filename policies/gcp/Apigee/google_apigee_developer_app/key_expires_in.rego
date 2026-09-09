package terraform.gcp.security.apigee.google_apigee_developer_app.key_expires_in
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_developer_app.vars
conditions := [
    [
        {
            "situation_description": "key_expires_in must not be -1 to ensure API keys have a finite expiration and promote regular key rotation",
            "remedies": [
                "Set key_expires_in to a positive value in milliseconds to enforce key expiration (e.g. 2592000000 for 30 days, 31536000000 for 365 days)"
            ]
        },
        {
            "condition": "check key_expires_in is not set to never expire",
            "attribute_path": ["key_expires_in"],
            "values": ["-1"],
            "policy_type": "blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
