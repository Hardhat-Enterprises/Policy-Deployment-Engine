package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.postgresql_private_connectivity_private_connection

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

violating_resources contains name if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type
    name := resource.values[resource_value_name]
    not resource.values.postgresql[0].private_connectivity[0].private_connection
}

message := [
    "Situation 1: PostgreSQL profiles must use private connectivity.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", violating_resources)]),
    "Potential Remedies: Set private_connectivity.private_connection to a valid URI.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
