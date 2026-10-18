package terraform.gcp.security.google_oracle_database_cloud_vm_cluster.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.vars

conditions := [
    [
    {"situation_description" : "The Cloud VM Cluster does not prevent Terraform from destroying it",
    "remedies":[ "Set deletion_policy to \"PREVENT\" so Terraform refuses to delete the cluster via destroy or a destructive apply"]},
    {
        "condition": "Test if deletion_policy is not set to PREVENT",
        "attribute_path" : ["deletion_policy"],
        "values" : ["PREVENT"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.deletion_policy.message"
message := result.message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.deletion_policy.details"
details := result.details
