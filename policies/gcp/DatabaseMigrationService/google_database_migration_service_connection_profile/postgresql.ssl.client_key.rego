package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.postgresql_ssl_client_key

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
    value := object.get(ssl, "client_key", "")

    not regex.match(`^-----BEGIN (RSA |EC )?PRIVATE KEY-----[\s\S]+-----END (RSA |EC )?PRIVATE KEY-----\s*$`, value)
}

message := [
    "Situation 1: PostgreSQL SSL client keys must be PEM formatted.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", [name | name := violating_resources[_]])]),
    "Potential Remedies: Provide a PEM private key bounded by matching BEGIN and END PRIVATE KEY markers.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
