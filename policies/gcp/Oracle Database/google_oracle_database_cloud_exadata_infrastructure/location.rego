package terraform.gcp.security.oracle_database.google_oracle_database_cloud_exadata_infrastructure.location
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_cloud_exadata_infrastructure.vars

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

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.google_oracle_database_cloud_exadata_infrastructure.location.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.google_oracle_database_cloud_exadata_infrastructure.location.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
