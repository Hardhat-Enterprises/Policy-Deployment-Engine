package terraform.gcp.security.oracle_database.google_oracle_database_exadb_vm_cluster.properties_data_collection_options_is_incident_logs_enabled
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_exadb_vm_cluster.vars
conditions := [
	[
		{
			"situation_description": "If is_incident_logs_enabled is left unset or false, incident logs and trace collection are not captured for the ExadbVmCluster, removing the audit trail needed for security incident investigation and forensics.",
			"remedies": [
				"Set properties.data_collection_options.is_incident_logs_enabled to true in the google_oracle_database_exadb_vm_cluster resource.",
				"This ensures an audit trail is retained for incident investigation.",
				"Consult Google Cloud documentation on data_collection_options for details."
			]
		},
		{
			"condition": "Check if is_incident_logs_enabled is set to true",
			"attribute_path": ["properties", 0, "data_collection_options", 0, "is_incident_logs_enabled"],
			"values": [true],
			"policy_type": "Whitelist"
		}
	]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details