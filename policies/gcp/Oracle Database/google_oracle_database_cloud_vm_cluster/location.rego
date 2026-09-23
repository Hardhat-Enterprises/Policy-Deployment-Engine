package terraform.gcp.security.google_oracle_database_cloud_vm_cluster.location
import data.terraform.helpers
import data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.vars

conditions := [
    [
    {"situation_description" : "The Cloud VM Cluster is deployed outside the approved Australian regions",
    "remedies":[ "Deploy the cluster in an approved region (australia-southeast1 or australia-southeast2) to meet data residency requirements"]},
    {
        "condition": "Test if location is not an approved Australian region",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1", "australia-southeast2"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.location.message"
message := result.message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.location.details"
details := result.details
