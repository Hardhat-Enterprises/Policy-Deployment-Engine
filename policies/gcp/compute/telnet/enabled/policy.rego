package terraform.gcp.security.compute.telnet.enabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.telnet.vars

message[msg] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    input.planned_values.root_module.resources[i].values.port == 23
    msg := sprintf(
        "Resource '%s' allows insecure Telnet (port 23).",
        [input.planned_values.root_module.resources[i].name]
    )
}

details[res] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    res := {
        "resource": input.planned_values.root_module.resources[i].name,
        "type": input.planned_values.root_module.resources[i].type,
        "port": input.planned_values.root_module.resources[i].values.port
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
        "message": "No non-compliant Telnet firewall rules found."
    }
}
