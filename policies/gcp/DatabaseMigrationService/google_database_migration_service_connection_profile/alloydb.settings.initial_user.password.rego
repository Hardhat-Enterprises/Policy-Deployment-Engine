package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.alloydb_settings_initial_user_password

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

violating_resources contains name if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type
    name := resource.values[resource_value_name]
    v := resource.values.alloydb[0].settings[0].initial_user[0].password
    v != "secure-password"
}

message := [
    "Situation 1: AlloyDB initial user password is not set to the approved secure value.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", violating_resources)]),
    "Potential Remedies: Set alloydb.settings.initial_user.password to the approved secure value.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
