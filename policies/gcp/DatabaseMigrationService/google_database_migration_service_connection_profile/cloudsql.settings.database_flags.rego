package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.cloudsql_settings_database_flags

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

conditions := []

violating_resources contains name if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type
    name := resource.values[resource_value_name]
   not resource.values.cloudsql[0].settings[0].database_flags.cloudsql_iam_authentication == "on"
}

message := [
    "Situation 1: CloudSQL IAM database authentication is disabled, which can require reliance on static database passwords.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", violating_resources)]),
    "Potential Remedies: Set cloudsql_iam_authentication to \"on\" in cloudsql.settings.database_flags.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
