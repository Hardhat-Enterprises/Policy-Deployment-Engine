package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.oracle_forward_ssh_connectivity_password

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

conditions := []

violating_resources contains name if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type
    name := resource.values[resource_value_name]
    conn := resource.values.oracle[0].forward_ssh_connectivity[0]
    object.get(conn, "password", null) == null
}

message := [
    "Situation 1: oracle.forward_ssh_connectivity.password is not configured.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", violating_resources)]),
    "Potential Remedies: Set oracle.forward_ssh_connectivity.password when Oracle forward SSH connectivity is used.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
