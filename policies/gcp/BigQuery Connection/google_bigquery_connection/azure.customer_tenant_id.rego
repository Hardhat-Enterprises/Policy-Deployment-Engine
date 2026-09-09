package terraform.gcp.security.bigquery.google_bigquery_connection.azure_customer_tenant_id

import data.terraform.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_connection.vars

conditions := [
    [
    {"situation_description" : "azure.customer_tenant_id references an untrusted tenant",
    "remedies":[ "Only trust approved Azure Active Directory tenants for this connection"]},
    {
        "condition": "Test if customer_tenant_id references the untrusted tenant",
        "attribute_path" : ["azure", 0, "customer_tenant_id"],
        "values" : ["untrusted-tenant-id"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
