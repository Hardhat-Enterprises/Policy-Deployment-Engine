package terraform.gcp.security.oracle_database.google_oracle_database_exadb_vm_cluster.properties_data_collection_options_is_diagnostics_events_enabled
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_exadb_vm_cluster.vars
conditions := [
	[
		{
			"situation_description": "If is_diagnostics_events_enabled is left unset or false, diagnostic event data is not collected for the ExadbVmCluster, reducing visibility into anomalous or malicious activity and weakening incident detection and response capability.",
			"remedies": [
				"Set properties.data_collection_options.is_diagnostics_events_enabled to true in the google_oracle_database_exadb_vm_cluster resource.",
				"This ensures diagnostic events are collected for security monitoring.",
				"Consult Google Cloud documentation on data_collection_options for details."
			]
		},
		{
			"condition": "Check if is_diagnostics_events_enabled is set to true",
			"attribute_path": ["properties", 0, "data_collection_options", 0, "is_diagnostics_events_enabled"],
			"values": [true],
			"policy_type": "Whitelist"
		}
	]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details