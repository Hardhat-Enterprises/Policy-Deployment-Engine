package terraform.gcp.security.BigQuery.google_bigquery_connection.cloud_sql_password
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_connection.vars

weak_passwords := ["password", "123456", "abc123", "admin", "123", "abc", "pass", "1234", "12345"]

conditions := [
    [
        {"situation_description": "cloud_sql password is empty or null, which may allow unauthorised access to the Cloud SQL database", "remedies": ["Set a non-empty password in the cloud_sql credential block"]},
        {
            "condition": "Check if cloud_sql password is non-empty",
            "attribute_path": ["cloud_sql", "credential", "password"],
            "values": ["", null],
            "policy_type": "blacklist"
        }
    ],
    [
        {"situation_description": "cloud_sql password is too short, increasing the risk of brute force attacks", "remedies": ["Set a password with at least 12 characters"]},
        {
            "condition": "Check if cloud_sql password meets minimum length of 12 characters",
            "attribute_path": ["cloud_sql", "credential", "password"],
            "values": [null, 12],
            "policy_type": "length"
        }
    ],
    [
        {"situation_description": "cloud_sql password is a commonly used weak password, making it vulnerable to attacks", "remedies": ["Use a strong unique password that is not commonly used"]},
        {
            "condition": "Check if cloud_sql password is not a weak common password",
            "attribute_path": ["cloud_sql", "credential", "password"],
            "values": ["password", "123456", "abc123", "admin", "123", "abc", "pass", "1234", "12345"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details