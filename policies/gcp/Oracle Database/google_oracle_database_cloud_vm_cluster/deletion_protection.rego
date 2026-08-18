package terraform.gcp.security.google_oracle_database_cloud_vm_cluster.deletion_protection
import data.terraform.helpers
import data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.vars

conditions := [
    [
    {"situation_description" : "The Cloud VM Cluster can be destroyed by Terraform without an explicit safeguard",
    "remedies":[ "Set deletion_protection to true so a terraform destroy or a destructive apply against this cluster will fail"]},
    {
        "condition": "Test if deletion_protection is not set to true",
        "attribute_path" : ["deletion_protection"],
        "values" : [true],
        "policy_type" : "whitelist"
    }
    ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.cloud_vm_cluster.deletion_protection.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.cloud_vm_cluster.deletion_protection.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
