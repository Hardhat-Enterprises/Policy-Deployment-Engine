package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_allowed_key_types_rsa_min_modulus_size

import data.terraform.helpers
import data.terraform.helpers.shared
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

# The declared condition documents the argument and checks an RSA entry in
# position zero. The additional check below covers every RSA entry.
conditions := [
    [
        {
            "situation_description": "CA Pool RSA key types must require a minimum modulus size of at least 3072 bits.",
            "remedies": [
                "Set min_modulus_size to at least 3072 on every allowed RSA key type.",
                "Specify allowed_key_types so the pool does not fall back to the service-wide RSA minimum."
            ]
        },
        {
            "condition": "first RSA entry must have an approved minimum",
            "attribute_path": ["issuance_policy", 0, "allowed_key_types", 0, "rsa", 0, "min_modulus_size"],
            "values": [0, "0"],
            "policy_type": "blacklist"
        }
    ]
]

weak_minimum(value) if {
    value == null
}

weak_minimum(value) if {
    value != null
    to_number(value) < 3072
}

rsa_violations := {
    {
        "name": shared.get_resource_attribute(resource, vars.variables.resource_value_name),
        "message": "An allowed RSA key type has no explicit minimum of at least 3072 bits."
    } |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
    key_types := object.get(resource.values, ["issuance_policy", 0, "allowed_key_types"], [])
    some key_type in key_types
    rsa_blocks := object.get(key_type, "rsa", [])
    some rsa in rsa_blocks
    minimum := object.get(rsa, "min_modulus_size", null)
    weak_minimum(minimum)
}

unrestricted_violations := {
    {
        "name": shared.get_resource_attribute(resource, vars.variables.resource_value_name),
        "message": "No allowed key types are set, so the 3072-bit RSA minimum is not enforced."
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
            {"every RSA entry has an explicit minimum of at least 3072 bits": extra_violations}
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