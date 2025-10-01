package terraform.gcp.security.compute.ssh.open_to_world

import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.ssh.vars

# deny message for failing resources
message[msg] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    input.planned_values.root_module.resources[i].values.port == 22
    input.planned_values.root_module.resources[i].values.source_ranges[_] == "0.0.0.0/0"
    msg := sprintf(
        "Resource '%s' exposes SSH (port 22) to the world (0.0.0.0/0). Restrict access to authorized IP ranges.", 
        [input.planned_values.root_module.resources[i].name]
    )
}

# details object (all evaluated resources)
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

# pass/fail summary
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
        "message": "No non-compliant SSH firewall rules found."
    }
}
