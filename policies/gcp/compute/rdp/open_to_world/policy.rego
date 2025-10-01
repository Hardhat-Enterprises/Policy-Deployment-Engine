package terraform.gcp.security.compute.rdp.open_to_world

import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.rdp.vars

message[msg] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    input.planned_values.root_module.resources[i].values.port == 3389
    input.planned_values.root_module.resources[i].values.source_ranges[_] == "0.0.0.0/0"
    msg := sprintf(
        "Resource '%s' exposes RDP (port 3389) to the world (0.0.0.0/0). Restrict access to authorized IP ranges.",
        [input.planned_values.root_module.resources[i].name]
    )
}

details[res] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    res := {
        "resource": input.planned_values.root_module.resources[i].name,
        "type": input.planned_values.root_module.resources[i].type,
        "port": input.planned_values.root_module.resources[i].values.port,
        "source_ranges": input.planned_values.root_module.resources[i].values.source_ranges
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
        "message": "No non-compliant RDP firewall rules found."
    }
}
