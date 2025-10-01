package terraform.gcp.security.compute.firewall.egress_allowlist

# import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.firewall.vars

message[msg] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    input.planned_values.root_module.resources[i].values.direction == "EGRESS"
    input.planned_values.root_module.resources[i].values.destination_ranges[_] == "0.0.0.0/0"
    msg := sprintf(
        "Firewall '%s' allows unrestricted egress traffic.",
        [input.planned_values.root_module.resources[i].name]
    )
}

details[res] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    res := {
        "resource": input.planned_values.root_module.resources[i].name,
        "type": input.planned_values.root_module.resources[i].type,
        "destination_ranges": input.planned_values.root_module.resources[i].values.destination_ranges
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
        "message": "No firewall rules with unrestricted egress traffic found."
    }
}
