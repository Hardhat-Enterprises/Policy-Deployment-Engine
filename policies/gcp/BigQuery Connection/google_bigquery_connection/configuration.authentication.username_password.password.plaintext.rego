package terraform.gcp.security.bigquery.google_bigquery_connection.configuration_authentication_username_password_password_plaintext

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_connection.vars

conditions := [
    [
    {"situation_description" : "configuration authentication plaintext password is empty",
    "remedies":[ "Set a non-empty plaintext password for the connector authentication"]},
    {
        "condition": "Test if plaintext password is empty",
        "attribute_path" : ["configuration", 0, "authentication", 0, "username_password", 0, "password", 0, "plaintext"],
        "values" : [""],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
