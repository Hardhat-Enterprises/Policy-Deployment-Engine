package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.oracle_forward_ssh_connectivity_password

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

conditions := []

violating_resources contains resource.values[resource_value_name] if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type

    oracle := resource.values.oracle
    count(oracle) > 0
    ssh := object.get(oracle[0], "forward_ssh_connectivity", [{}])[0]
    password := object.get(ssh, "password", null)
    password != null
    password != ""
}

message := [
    "Situation 1: Oracle forward SSH connectivity must not use an inline static password.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", [name | name := violating_resources[_]])]),
    "Potential Remedies: Use private connectivity instead of password-based forward SSH authentication.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
