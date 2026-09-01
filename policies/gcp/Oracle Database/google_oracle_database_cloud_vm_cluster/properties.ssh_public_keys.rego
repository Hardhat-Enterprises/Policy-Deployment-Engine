package terraform.gcp.security.google_oracle_database_cloud_vm_cluster.properties_ssh_public_keys
import data.terraform.helpers
import data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.vars

conditions := [
    [
    {"situation_description" : "The Cloud VM Cluster has SSH public keys configured that use a known-insecure or placeholder value, risking unauthorised or unmanaged administrative access",
    "remedies":[ "Remove placeholder/example key values and provide a real, valid SSH public key in the standard 'ssh-<type> <key-data>' format (e.g. ssh-ed25519, ssh-rsa) for every administrator who needs access"]},
    {
        "condition": "Test if any ssh_public_keys entry is a known-insecure or placeholder value",
        "attribute_path" : ["properties", 0, "ssh_public_keys"],
        "values" : ["not-a-valid-ssh-key", "changeme", "test", "ssh-key"],
        "policy_type" : "element blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.properties_ssh_public_keys.message"
message := result.message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.properties_ssh_public_keys.details"
details := result.details
