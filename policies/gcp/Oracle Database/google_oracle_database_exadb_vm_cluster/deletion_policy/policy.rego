package terraform.gcp.security.oracle_database.google_oracle_database_exadb_vm_cluster.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_exadb_vm_cluster.vars
conditions := [
	[
		{
			"situation_description": "The ExadbVmCluster's deletion_policy allows the resource to be destroyed via terraform destroy or apply, risking accidental removal of an active database cluster and its data.",
			"remedies": [
				"Set deletion_policy to PREVENT in the google_oracle_database_exadb_vm_cluster resource.",
				"This blocks accidental deletion via terraform destroy or apply.",
				"Consult Google Cloud documentation on deletion_policy for details."
			]
		},
		{
			"condition": "Check if deletion_policy is set to PREVENT",
			"attribute_path": ["deletion_policy"],
			"values": ["PREVENT"],
			"policy_type": "Whitelist"
		}
	]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details