package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.cloudsql_settings_database_flags

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

violating_resources contains name if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type
    name := resource.values[resource_value_name]
    v := resource.values.cloudsql[0].settings[0].database_flags.cloudsql_iam_authentication
    v != "on"
}

message := [
    "Situation 1: CloudSQL database flags do not match the approved secure configuration.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", violating_resources)]),
    "Potential Remedies: Set cloudsql.settings.database_flags to the approved secure configuration.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
