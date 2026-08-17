package terraform.gcp.security.oracle_database.cloud_exadata_infrastructure.location
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.cloud_exadata_infrastructure.vars

conditions := [
    [
    {"situation_description" : "The Cloud Exadata Infrastructure is deployed outside the approved Australian regions",
    "remedies":[ "Deploy the infrastructure in an approved region (australia-southeast1 or australia-southeast2) to meet data residency requirements"]},
    {
        "condition": "Test if location is not an approved Australian region",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1", "australia-southeast2"],
        "policy_type" : "whitelist"
    }
    ]
]