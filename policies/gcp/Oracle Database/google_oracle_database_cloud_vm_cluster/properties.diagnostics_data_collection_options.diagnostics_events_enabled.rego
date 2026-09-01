package terraform.gcp.security.google_oracle_database_cloud_vm_cluster.properties_diagnostics_data_collection_options_diagnostics_events_enabled
import data.terraform.helpers
import data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.vars

conditions := [
    [
    {"situation_description" : "The Cloud VM Cluster has diagnostic events collection enabled, capturing metadata about system behaviour that could aid an attacker if exposed",
    "remedies":[ "Set properties.diagnostics_data_collection_options.diagnostics_events_enabled to false unless diagnostic event collection is explicitly required and its output is securely handled"]},
    {
        "condition": "Test if diagnostics_events_enabled is not set to false",
        "attribute_path" : ["properties", 0, "diagnostics_data_collection_options", 0, "diagnostics_events_enabled"],
        "values" : [false],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.properties_diagnostics_data_collection_options_diagnostics_events_enabled.message"
message := result.message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.google_oracle_database_cloud_vm_cluster.properties_diagnostics_data_collection_options_diagnostics_events_enabled.details"
details := result.details
