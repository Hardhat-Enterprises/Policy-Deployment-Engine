package terraform.gcp.security.oracle_database.google_oracle_database_exadb_vm_cluster.properties_ssh_public_keys
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_exadb_vm_cluster.vars
conditions := [
	[
		{
			"situation_description": "If ssh_public_keys is left empty or omitted, no explicit SSH keys are provisioned for administrative access to the ExadbVmCluster's VM nodes, which can leave the platform's default provisioning key as the only access path or leave the cluster without a controlled point of entry.",
			"remedies": [
				"Set properties.ssh_public_keys to a non-empty list of deliberately-issued SSH public keys in the google_oracle_database_exadb_vm_cluster resource.",
				"Avoid weak key types (e.g. ssh-dss) or unusually short RSA keys.",
				"Consult Google Cloud documentation on ssh_public_keys for details."
			]
		},
		{
			"condition": "Check that ssh_public_keys is not empty or omitted",
			"attribute_path": ["properties", 0, "ssh_public_keys"],
			"values": [null, []],
			"policy_type": "Blacklist"
		}
	]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details