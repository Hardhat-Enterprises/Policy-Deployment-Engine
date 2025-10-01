package terraform.gcp.security.dns.recursion_enabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dns.vars

message[msg] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    input.planned_values.root_module.resources[i].values.recursion_enabled == true
    msg := sprintf(
        "DNS managed zone '%s' has recursion enabled. Disable recursion for security.",
        [input.planned_values.root_module.resources[i].name]
    )
}

details[res] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    res := {
        "resource": input.planned_values.root_module.resources[i].name,
        "type": input.planned_values.root_module.resources[i].type,
        "recursion_enabled": input.planned_values.root_module.resources[i].values.recursion_enabled
    }
}

result[res] if {
    msg := message[_]
    res := {
        "status": "fail",
        "message": msg
    }
}

result[res] if {
    count(message) == 0
    res := {
        "status": "pass",
        "message": "No DNS zones with recursion enabled found."
    }
}
