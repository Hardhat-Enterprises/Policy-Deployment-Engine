package terraform.gcp.security.oracle_database.google_oracle_database_exadb_vm_cluster.deletion_protection
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_exadb_vm_cluster.vars
conditions := [
	[
		{
			"situation_description": "If deletion_protection is left unset or false, Terraform will not block a terraform destroy or apply that would delete the ExadbVmCluster, risking accidental loss of an active database cluster and its data.",
			"remedies": [
				"Set deletion_protection to true in the google_oracle_database_exadb_vm_cluster resource.",
				"This is a second, independent safeguard against accidental destruction, on top of deletion_policy.",
				"Consult Google Cloud documentation on deletion_protection for details."
			]
		},
		{
			"condition": "Check if deletion_protection is set to true",
			"attribute_path": ["deletion_protection"],
			"values": [true],
			"policy_type": "Whitelist"
		}
	]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details