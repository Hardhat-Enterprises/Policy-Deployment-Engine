package terraform.gcp.security.google_oracle_database_cloud_vm_cluster.properties_diagnostics_data_collection_options_incident_logs_enabled
import data.terraform.helpers
import data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.vars

conditions := [
    [
    {"situation_description" : "The Cloud VM Cluster has incident logs and trace collection enabled, which may capture sensitive error details that could reveal system vulnerabilities if exposed",
    "remedies":[ "Set properties.diagnostics_data_collection_options.incident_logs_enabled to false unless incident log collection is explicitly required and its output is securely stored with limited access"]},
    {
        "condition": "Test if incident_logs_enabled is not set to false",
        "attribute_path" : ["properties", "diagnostics_data_collection_options", "incident_logs_enabled"],
        "values" : [false],
        "policy_type" : "whitelist"
    }
    ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.cloud_vm_cluster.properties_diagnostics_data_collection_options_incident_logs_enabled.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.cloud_vm_cluster.properties_diagnostics_data_collection_options_incident_logs_enabled.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
