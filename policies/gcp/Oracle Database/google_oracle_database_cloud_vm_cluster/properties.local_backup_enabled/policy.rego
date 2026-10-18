package terraform.gcp.security.google_oracle_database_cloud_vm_cluster.properties_local_backup_enabled
import data.terraform.helpers
import data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.vars

conditions := [
    [
    {"situation_description" : "The Cloud VM Cluster does not maintain a local on-cluster backup, leaving it without a recovery path against destructive or irrecoverable data loss",
    "remedies":[ "Set properties.local_backup_enabled to true so the cluster retains a local backup copy it can be restored from after a destructive event such as ransomware, malicious deletion, or storage corruption"]},
    {
        "condition": "Test if local_backup_enabled is not set to true",
        "attribute_path" : ["properties", 0, "local_backup_enabled"],
        "values" : [true],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.properties_local_backup_enabled.message"
message := result.message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.properties_local_backup_enabled.details"
details := result.details
