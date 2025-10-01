package terraform.gcp.security.compute.smtp.open_relay

import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.smtp.vars

message[msg] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    input.planned_values.root_module.resources[i].values.open_relay == true
    msg := sprintf(
        "Resource '%s' is configured as an open SMTP relay.",
        [input.planned_values.root_module.resources[i].name]
    )
}

details[res] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    res := {
        "resource": input.planned_values.root_module.resources[i].name,
        "type": input.planned_values.root_module.resources[i].type,
        "open_relay": input.planned_values.root_module.resources[i].values.open_relay
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
        "message": "No non-compliant SMTP instances found."
    }
}
