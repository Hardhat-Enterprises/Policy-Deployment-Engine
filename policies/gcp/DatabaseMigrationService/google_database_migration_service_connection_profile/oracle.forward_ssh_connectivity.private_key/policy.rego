package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.oracle_forward_ssh_connectivity_private_key

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
    private_key := object.get(ssh, "private_key", null)
    private_key != null
    private_key != ""
}

message := [
    "Situation 1: Oracle forward SSH private keys must not be embedded in Terraform configuration.",
    sprintf("Non-Compliant Resources: %s", [concat(", ", [name | name := violating_resources[_]])]),
    "Potential Remedies: Keep key-based SSH authentication out-of-band; do not embed its private key in Terraform configuration.",
] if {
    count(violating_resources) > 0
}

message := [] if {
    count(violating_resources) == 0
}

details := {}
