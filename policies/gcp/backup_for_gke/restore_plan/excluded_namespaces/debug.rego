package terraform.gcp.security.backup_for_gke.restore_plan.excluded_namespaces_debug

import data.terraform.helpers.shared

debug_value[msg] if {
    resource := input.planned_values.root_module.resources[_]
    resource.name == "nc"
    path := ["restore_config", 0, "excluded_namespaces", 0, "namespaces"]
    val := shared.get_attribute_value(resource, path)
    msg := sprintf("Value for %s: %v", [resource.name, val])
}
