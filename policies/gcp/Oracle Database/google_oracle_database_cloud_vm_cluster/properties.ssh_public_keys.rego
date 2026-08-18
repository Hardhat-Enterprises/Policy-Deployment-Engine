package terraform.gcp.security.google_oracle_database_cloud_vm_cluster.properties_ssh_public_keys
import data.terraform.helpers
import data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.vars

conditions := [
    [
    {"situation_description" : "The Cloud VM Cluster has SSH public keys configured that are missing or not well-formed, risking unauthorised or unmanaged administrative access",
    "remedies":[ "Provide valid SSH public keys in the standard 'ssh-<type> <key-data>' format (e.g. ssh-ed25519, ssh-rsa) for every administrator who needs access"]},
    {
        "condition": "Test if any ssh_public_keys entry does not match a valid SSH public key format",
        "attribute_path" : ["properties", "ssh_public_keys"],
        "values" : ["^ssh-(rsa|ed25519|ecdsa-sha2-nistp256|ecdsa-sha2-nistp384|ecdsa-sha2-nistp521) "],
        "policy_type" : "pattern whitelist"
    }
    ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.cloud_vm_cluster.properties_ssh_public_keys.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.cloud_vm_cluster.properties_ssh_public_keys.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
