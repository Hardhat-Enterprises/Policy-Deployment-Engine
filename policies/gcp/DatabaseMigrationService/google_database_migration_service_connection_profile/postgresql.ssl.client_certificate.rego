package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.postgresql_ssl_client_certificate

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

conditions := []

violating_resources contains name if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type
    name := resource.values[resource_value_name]
    ssl := resource.values.postgresql[0].ssl[0]
    object.get(ssl, "client_certificate", null) == null
}

message := [
    "Situation 1: postgresql.ssl.client_certificate is not configured.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", violating_resources)]),
    "Potential Remedies: Set postgresql.ssl.client_certificate to support SSL verification or client certificate authentication.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
