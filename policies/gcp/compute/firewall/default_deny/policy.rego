package terraform.gcp.security.compute.firewall.default_deny

import data.terraform.gcp.security.compute.firewall.vars

# Collect messages for failing resources
message[msg] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    input.planned_values.root_module.resources[i].values.allow_all == true
    msg := sprintf(
        "Default firewall rule '%s' allows all traffic. It must be removed or restricted.",
        [input.planned_values.root_module.resources[i].name]
    )
}

# Details of evaluated resources
details[res] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    res := {
        "resource": input.planned_values.root_module.resources[i].name,
        "allow_all": input.planned_values.root_module.resources[i].values.allow_all
    }
}

# Single pass/fail summary object
result[res] if {
    some msg
    message[msg]
    res := {
        "status": "fail",
        "message": msg
    }
}

result[res] if {
    count(message) == 0
    res := {
        "status": "pass",
        "message": "No default-allow-all firewall rules found."
    }
}
