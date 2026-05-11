package terraform.gcp.security.firebase_app_check.google_firebase_app_check_app_attest_config.token_ttl

import data.terraform.gcp.security.firebase_app_check.google_firebase_app_check_app_attest_config.vars

_min_ttl := 1800
_max_ttl := 86400
_situation := "Firebase App Attest token_ttl must be between 1800s (30 min) and 86400s (24 hours) to balance usability and security."

_all_resources := [r |
    r := input.planned_values.root_module.resources[_]
    r.type == vars.variables.resource_type
]

_outside_range(v) if { v < _min_ttl }
_outside_range(v) if { v > _max_ttl }

_nc_names := [r.values[vars.variables.resource_value_name] |
    r := _all_resources[_]
    ttl_num := to_number(trim_suffix(r.values.token_ttl, "s"))
    _outside_range(ttl_num)
]

message := array.concat(
    [sprintf("Total %s detected: %d ", [vars.variables.friendly_resource_name, count(_all_resources)])],
    _situation_lines
)

_situation_lines := [
    sprintf("Situation 1: %s", [_situation]),
    sprintf("Non-Compliant Resources: %s", [concat(", ", _nc_names)]),
    "Potential Remedies: Set token_ttl to a value between 1800s (30 min) and 86400s (24 hours)."
] if { count(_nc_names) > 0 }

_situation_lines := [
    sprintf("Situation 1: %s", [_situation]),
    "Non-Compliant Resources: None - All passed"
] if { count(_nc_names) == 0 }
