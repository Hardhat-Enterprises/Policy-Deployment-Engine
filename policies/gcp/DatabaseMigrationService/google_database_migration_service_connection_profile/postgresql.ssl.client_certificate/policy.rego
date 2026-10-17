package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.postgresql_ssl_client_certificate

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

conditions := []

invalid_client_certificate(value) if {
    value == ""
}

invalid_client_certificate(value) if {
    value != null
    value != ""
    not regex.match(`^-----BEGIN CERTIFICATE-----[\s\S]+-----END CERTIFICATE-----\s*$`, value)
}

violating_resources contains resource.values[resource_value_name] if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type

    postgresql := resource.values.postgresql
    count(postgresql) > 0

    ssl := object.get(postgresql[0], "ssl", [{}])[0]
    client_certificate := object.get(ssl, "client_certificate", null)
    invalid_client_certificate(client_certificate)
}

message := [
    "Situation 1: PostgreSQL client certificates, when configured, must be non-empty and PEM formatted.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", [name | name := violating_resources[_]])]),
    "Potential Remedies: Omit client_certificate when mutual TLS is not used, or provide a valid PEM certificate.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
