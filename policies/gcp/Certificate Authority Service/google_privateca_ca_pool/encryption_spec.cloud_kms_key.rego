package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.encryption_spec_cloud_kms_key

import data.terraform.helpers
import data.terraform.helpers.shared
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pools must use a non-empty customer-managed Cloud KMS key with a valid CryptoKey resource path.",
            "remedies": [
                "Set encryption_spec.cloud_kms_key to an existing Cloud KMS CryptoKey.",
                "Use the format projects/{project}/locations/{location}/keyRings/{keyring}/cryptoKeys/{key}."
            ]
        },
        {
            "condition": "Cloud KMS key must be configured",
            "attribute_path": ["encryption_spec", 0, "cloud_kms_key"],
            "values": [null, "", "invalid-kms-key"],
            "policy_type": "blacklist"
        }
    ]
]

valid_kms_key(key) if {
    is_string(key)
    regex.match(
        "^projects/[^/]+/locations/[^/]+/keyRings/[^/]+/cryptoKeys/[^/]+$",
        key
    )
}

invalid_key_violations := {
    {
        "name": shared.get_resource_attribute(resource, vars.variables.resource_value_name),
        "message": "Cloud KMS key must be a complete projects/.../locations/.../keyRings/.../cryptoKeys/... path."
    } |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
    key := object.get(resource.values, ["encryption_spec", 0, "cloud_kms_key"], null)
    not valid_kms_key(key)
}

result := helpers.get_multi_summary(conditions, vars.variables)

invalid_names := {violation.name | some violation in invalid_key_violations}
original_situation := result.details[0]
failing_names := original_situation.non_compliant_resources | invalid_names

details := [
    object.union(original_situation, {
        "non_compliant_resources": failing_names,
        "conditions": array.concat(original_situation.conditions, [
            {"Cloud KMS key must have a complete CryptoKey path": invalid_key_violations}
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