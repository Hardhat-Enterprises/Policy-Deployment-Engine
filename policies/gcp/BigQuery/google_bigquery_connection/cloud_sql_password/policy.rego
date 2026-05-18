package terraform.gcp.security.BigQuery.google_bigquery_connection.cloud_sql_password
import data.terraform.helpers
import data.terraform.gcp.security.BigQuery.google_bigquery_connection.vars

conditions := [
    [
        {
            "situation_description": "cloud_sql credential password is set to a common weak value (e.g. 'password', '123456', 'admin'), which allows trivial unauthorised access to the Cloud SQL database",
            "remedies": [
                "Set cloud_sql.credential.password to a strong unique value of at least 12 characters",
                "Avoid common weak passwords such as 'password', '123456', 'admin', 'root'"
            ]
        },
        {
            "condition": "password must not be a common weak value",
            "attribute_path": ["cloud_sql", 0, "credential", 0, "password"],
            "values": ["password", "123456", "admin", "root", "12345678", "qwerty"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details