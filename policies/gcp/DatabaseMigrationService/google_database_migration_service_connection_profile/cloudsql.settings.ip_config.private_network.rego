package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.cloudsql_settings_ip_config_private_network

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

conditions := []

violating_resources contains name if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type
    name := resource.values[resource_value_name]

    ip_config := resource.values.cloudsql[0].settings[0].ip_config[0]
    private_network := object.get(ip_config, "private_network", "")
    not regex.match("^projects/[^/]+/global/networks/[^/]+$", private_network)
}

message := [
    "Situation 1: CloudSQL profiles must use a valid private VPC network for connectivity.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", [name | name := violating_resources[_]])]),
    "Potential Remedies: Set cloudsql.settings.ip_config.private_network to a valid projects/<project>/global/networks/<network> URI.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
