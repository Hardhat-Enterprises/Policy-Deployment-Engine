package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.alloydb_settings_initial_user_password

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

conditions := []

violating_resources contains resource.values[resource_value_name] if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type

    alloydb := resource.values.alloydb
    count(alloydb) > 0

    settings := alloydb[0].settings
    initial_user := object.get(settings[0], "initial_user", [{}])[0]
    password := object.get(initial_user, "password", "")

    regex.match(`(?i)^(|password|changeme|default|weak-password)$`, password)
}

message := [
    "Situation 1: AlloyDB initial-user passwords must not be blank or obvious defaults.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", [name | name := violating_resources[_]])]),
    "Potential Remedies: Use a non-default secret managed through an approved secret-management process.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
