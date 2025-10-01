package terraform.gcp.security.compute.http_to_https.redirect_disabled

import data.terraform.gcp.security.compute.http_to_https.redirect_disabled.vars

# deny message for failing resources
message[msg] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    input.planned_values.root_module.resources[i].values.redirect_http_to_https == false
    msg := sprintf(
        "Backend service '%s' does not redirect HTTP traffic to HTTPS. Enable redirect.",
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
        "redirect_http_to_https": input.planned_values.root_module.resources[i].values.redirect_http_to_https
    }
}

# fail result
result[res] if {
    msg := message[_]
    res := {
        "status": "fail",
        "message": msg
    }
}

# pass result
result[res] if {
    count(message) == 0
    res := {
        "status": "pass",
        "message": "All backend services redirect HTTP to HTTPS."
    }
}
