package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.postgresql_ssl_ca_certificate

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

conditions := []

empty(value) if {
    value == null
}

empty(value) if {
    value == ""
}

violating_resources contains resource.values[resource_value_name] if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type

    postgresql := resource.values.postgresql
    count(postgresql) > 0
    ssl := object.get(postgresql[0], "ssl", [{}])[0]
    ca_certificate := object.get(ssl, "ca_certificate", null)
    empty(ca_certificate)
}

message := [
    "Situation 1: PostgreSQL SSL profiles must configure a CA certificate for server identity verification.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", [name | name := violating_resources[_]])]),
    "Potential Remedies: Set ssl.ca_certificate to the approved CA certificate.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
