package terraform.gcp.security.oracle_database.google_oracle_database_cloud_exadata_infrastructure.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_cloud_exadata_infrastructure.vars

conditions := [
    [
    {"situation_description" : "The Cloud Exadata Infrastructure does not prevent Terraform from destroying it",
    "remedies":[ "Set deletion_policy to \"PREVENT\" so Terraform refuses to delete the infrastructure via destroy or a destructive apply"]},
    {
        "condition": "Test if deletion_policy is not set to PREVENT",
        "attribute_path" : ["deletion_policy"],
        "values" : ["PREVENT"],
        "policy_type" : "whitelist"
    }
    ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.google_oracle_database_cloud_exadata_infrastructure.deletion_policy.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.google_oracle_database_cloud_exadata_infrastructure.deletion_policy.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
