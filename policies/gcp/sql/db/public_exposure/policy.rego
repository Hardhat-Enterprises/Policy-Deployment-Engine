package terraform.gcp.security.sql.db.public_exposure

import data.terraform.gcp.helpers
import data.terraform.gcp.security.sql.db.vars

message[msg] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    input.planned_values.root_module.resources[i].values.public_ip == true
    msg := sprintf(
        "SQL instance '%s' is publicly accessible.",
        [input.planned_values.root_module.resources[i].name]
    )
}

details[res] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    res := {
        "resource": input.planned_values.root_module.resources[i].name,
        "type": input.planned_values.root_module.resources[i].type,
        "public_ip": input.planned_values.root_module.resources[i].values.public_ip
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
        "message": "No publicly accessible SQL instances found."
    }
}
