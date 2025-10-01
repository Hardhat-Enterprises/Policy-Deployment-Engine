package terraform.gcp.security.compute.ftp.anonymous_access

#import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.ftp.vars

message[msg] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    input.planned_values.root_module.resources[i].values.allow_anonymous == true
    msg := sprintf(
        "Resource '%s' allows anonymous FTP access.",
        [input.planned_values.root_module.resources[i].name]
    )
}

details[res] if {
    some i
    input.planned_values.root_module.resources[i].type == vars.variables.resource_type
    res := {
        "resource": input.planned_values.root_module.resources[i].name,
        "type": input.planned_values.root_module.resources[i].type,
        "allow_anonymous": input.planned_values.root_module.resources[i].values.allow_anonymous
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
        "message": "No non-compliant FTP instances found."
    }
}
