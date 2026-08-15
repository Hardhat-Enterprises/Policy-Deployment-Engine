package terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.web_settings_allow_amp_traffic

import data.terraform.helpers.policies.blacklist
import data.terraform.helpers.policies.whitelist
import data.terraform.gcp.security.recaptchaenterprise.google_recaptcha_enterprise_key.vars

# get_multi_summary's find_failing_resources does NOT correctly intersect
# multiple conditions within one situation (it silently unions violations
# across all conditions instead of intersecting them) -- verified empirically
# against real OPA. AMP support is only valid under SCORE integration, so this
# policy needs true AND semantics (allow_amp_traffic=true AND integration_type
# != SCORE) and is written by hand below rather than through the templated
# `conditions` list, reusing the already-correct blacklist/whitelist modules.

situation_description := "AMP traffic is enabled without the SCORE integration type, which is the only integration type AMP support is validated for."
remedies := [
    "Set web_settings.allow_amp_traffic to false unless AMP support is genuinely required.",
    "If AMP support is required, set web_settings.integration_type to SCORE."
]

amp_violations := blacklist.get_violations(vars.variables, ["web_settings", 0, "allow_amp_traffic"], [true])
type_violations := whitelist.get_violations(vars.variables, ["web_settings", 0, "integration_type"], ["SCORE"])

amp_names := {v.name | some v in amp_violations}
type_names := {v.name | some v in type_violations}

non_compliant_resources := amp_names & type_names

resource_count := count([r |
    r := input.planned_values.root_module.resources[_]
    r.type == vars.variables.resource_type
])

nc_list := [n | some n in non_compliant_resources]
display_list := ["None - All passed"] if { count(nc_list) == 0 } else := nc_list

message := [
    sprintf("Total %s detected: %d ", [vars.variables.friendly_resource_name, resource_count]),
    sprintf("Situation 1: %s", [situation_description]),
    sprintf("Non-Compliant Resources: %s", [concat(", ", display_list)]),
]

details := [{
    "situation": situation_description,
    "remedies": remedies,
    "non_compliant_resources": non_compliant_resources,
}]