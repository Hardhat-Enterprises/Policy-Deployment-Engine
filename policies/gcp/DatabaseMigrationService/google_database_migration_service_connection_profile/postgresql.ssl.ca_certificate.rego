package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.postgresql_ssl_ca_certificate

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

conditions := []

violating_resources contains resource.values[resource_value_name] if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type

    postgresql := resource.values.postgresql
    count(postgresql) > 0

    ssl := object.get(postgresql[0], "ssl", [{}])[0]
    value := object.get(ssl, "ca_certificate", "")

    not regex.match(`^-----BEGIN CERTIFICATE-----[\s\S]+-----END CERTIFICATE-----\s*$`, value)
}

message := [
    "Situation 1: PostgreSQL SSL CA certificates must be PEM formatted.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", [name | name := violating_resources[_]])]),
    "Potential Remedies: Provide a PEM certificate bounded by BEGIN CERTIFICATE and END CERTIFICATE.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
