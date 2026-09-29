package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.mysql_ssl_client_key

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

conditions := []

violating_resources contains resource.values[resource_value_name] if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type

    mysql := resource.values.mysql
    count(mysql) > 0
    ssl := object.get(mysql[0], "ssl", [{}])[0]
    client_key := object.get(ssl, "client_key", null)
    client_key != null
    client_key != ""
}

message := [
    "Situation 1: MySQL profiles must not embed client private keys in Terraform configuration.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", [name | name := violating_resources[_]])]),
    "Potential Remedies: Use server-only TLS or retrieve client credentials through approved external secret management.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
