package terraform.gcp.security.compute_engine.google_compute_firewall_policy_rule.tls_inspect
import data.terraform.gcp.security.compute_engine.google_compute_firewall_policy_rule.vars

resources := [r |
    r := input.planned_values.root_module.resources[_]
    r.type == "google_compute_firewall_policy_rule"
]

is_violating(r) if {
    r.values.action == "apply_security_profile_group"
    r.values.tls_inspect != true
}

violating_names := [r.name |
    r := resources[_]
    is_violating(r)
]

message := sprintf(
    "%s: action is apply_security_profile_group but tls_inspect is not true, meaning encrypted traffic bypasses inspection. Non-Compliant Resources: %v. Remedy: set tls_inspect to true when action is apply_security_profile_group.",
    [vars.variables.friendly_resource_name, violating_names]
) if {
    count(violating_names) > 0
}

message := sprintf("%s: all resources compliant.", [vars.variables.friendly_resource_name]) if {
    count(violating_names) == 0
}

details := violating_names
