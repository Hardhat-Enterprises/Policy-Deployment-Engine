package terraform.gcp.security.oracle_database.google_oracle_database_exadb_vm_cluster.location
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_exadb_vm_cluster.vars
conditions := [
	[
		{
			"situation_description": "The ExadbVmCluster's location determines which GCP region the resource — and the database data it holds — is created in. An unrestricted location can place regulated data outside approved regions, breaching data residency requirements.",
			"remedies": [
				"Set location to one of the organization's approved regions for the google_oracle_database_exadb_vm_cluster resource.",
				"Update this whitelist to match your organization's approved-region list.",
				"Consult your organization's data residency policy for the authoritative region list."
			]
		},
		{
			"condition": "Check if location is one of the approved regions",
			"attribute_path": ["location"],
			"values": ["us-east4", "us-central1", "australia-southeast1"],
			"policy_type": "Whitelist"
		}
	]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details