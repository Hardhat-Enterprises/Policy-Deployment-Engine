package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.cloudsql_settings_ip_config_authorized_networks_value

import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

resource_type := vars.variables.resource_type
resource_value_name := vars.variables.resource_value_name

conditions := []

violating_resources contains resource.values[resource_value_name] if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == resource_type

    cloudsql := resource.values.cloudsql
    count(cloudsql) > 0

    settings := cloudsql[0].settings
    ip_config := settings[0].ip_config[0]
    value := object.get(ip_config, "authorized_networks", [{}])[_].value

    regex.match(`^(0\.0\.0\.0/0|::/0)$`, value)
}

message := [
    "Situation 1: Cloud SQL authorised networks must not allow internet-wide CIDR ranges.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", [name | name := violating_resources[_]])]),
    "Potential Remedies: Remove 0.0.0.0/0 and ::/0 entries, or use a narrow approved CIDR range.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
