package terraform.gcp.security.bigquery.google_bigquery_connection.azure_federated_application_client_id

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_connection.vars

conditions := [
    [
    {"situation_description" : "azure.federated_application_client_id references an untrusted application",
    "remedies":[ "Only trust approved Azure Applications for federated credential hosting"]},
    {
        "condition": "Test if federated_application_client_id references the untrusted application",
        "attribute_path" : ["azure", 0, "federated_application_client_id"],
        "values" : ["untrusted-9999-0000-0000-a480155501ce"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
