package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_allowed_key_types_rsa_max_modulus_size

import data.terraform.helpers
import data.terraform.helpers.shared
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool RSA key types must have an explicit maximum modulus size of no more than 4096 bits.",
            "remedies": [
                "Set max_modulus_size to 4096 or less on every allowed RSA key type.",
                "Specify allowed_key_types so RSA keys cannot fall back to an unrestricted service-wide maximum."
            ]
        },
        {
            "condition": "an explicit zero RSA maximum is prohibited",
            "attribute_path": ["issuance_policy", 0, "allowed_key_types", 0, "rsa", 0, "max_modulus_size"],
            "values": [0, "0"],
            "policy_type": "blacklist"
        }
    ]
]

invalid_maximum(value) if {
    value == null
}

invalid_maximum(value) if {
    value != null
    to_number(value) == 0
}

invalid_maximum(value) if {
    value != null
    to_number(value) > 4096
}

rsa_violations := {
    {
        "name": shared.get_resource_attribute(resource, vars.variables.resource_value_name),
        "message": "An allowed RSA key type has no explicit maximum of 4096 bits or less."
    } |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
    key_types := object.get(resource.values, ["issuance_policy", 0, "allowed_key_types"], [])
    some key_type in key_types
    rsa_blocks := object.get(key_type, "rsa", [])
    some rsa in rsa_blocks
    maximum := object.get(rsa, "max_modulus_size", null)
    invalid_maximum(maximum)
}

unrestricted_violations := {
    {
        "name": shared.get_resource_attribute(resource, vars.variables.resource_value_name),
        "message": "No allowed key types are set, so an RSA maximum is not enforced."
    } |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
    key_types := object.get(resource.values, ["issuance_policy", 0, "allowed_key_types"], [])
    count(key_types) == 0
}

result := helpers.get_multi_summary(conditions, vars.variables)

extra_violations := rsa_violations | unrestricted_violations
extra_names := {violation.name | some violation in extra_violations}
original_situation := result.details[0]
failing_names := original_situation.non_compliant_resources | extra_names

details := [
    object.union(original_situation, {
        "non_compliant_resources": failing_names,
        "conditions": array.concat(original_situation.conditions, [
            {"every RSA entry has an explicit maximum of no more than 4096 bits": extra_violations}
        ])
    })
]

resource_count := count([
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
])

message := helpers.format_summary_messages(
    vars.variables.friendly_resource_name,
    resource_count,
    details
)