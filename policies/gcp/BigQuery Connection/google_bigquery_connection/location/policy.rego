package terraform.gcp.security.bigquery.google_bigquery_connection.location

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_connection.vars

conditions := [
    [
    {"situation_description" : "location is outside the approved region whitelist",
    "remedies":[ "Deploy the resource in an approved region for data residency compliance"]},
    {
        "condition": "Test if location is not in the approved whitelist",
        "attribute_path" : ["location"],
        "values" : ["US", "EU", "us-central1"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
