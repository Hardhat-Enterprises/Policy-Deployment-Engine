package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.cloudsql_settings_ip_config_authorized_networks_value

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

conditions := []

violating_resources contains name if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type
    name := resource.values[resource_value_name]
    ip_config := resource.values.cloudsql[0].settings[0].ip_config[0]
    count(object.get(ip_config, "authorized_networks", [])) > 0
}

message := [
    "Situation 1: CloudSQL authorized networks must not allow external connections.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", violating_resources)]),
    "Potential Remedies: Remove all entries in cloudsql.settings.ip_config.authorized_networks.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
