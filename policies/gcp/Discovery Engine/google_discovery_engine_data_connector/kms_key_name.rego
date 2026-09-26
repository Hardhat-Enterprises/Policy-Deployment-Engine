package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

# A valid CMEK reference must use the generic Cloud KMS resource-name structure.
valid_kms_key_name(value) if {
    is_string(value)
    regex.match(
        `^projects/[^/]+/locations/[^/]+/keyRings/[^/]+/cryptoKeys/[^/]+$`,
        value,
    )
}

# Collect values that fail the structural check. This does not approve or
# constrain any specific project, location, key ring, or key identifier.
invalid_kms_key_names := [kms_key_name |
    some resource in input.planned_values.root_module.resources
    resource.type == vars.variables.resource_type
    kms_key_name := object.get(resource.values, "kms_key_name", null)
    not valid_kms_key_name(kms_key_name)
]

conditions := [
    [
        {
            "situation_description": "Does the connector configure a valid CMEK resource name?",
            "remedies": ["Set kms_key_name to a valid Cloud KMS crypto key resource name."],
        },
        {
            "condition": "KMS key name does not match the required CMEK structure",
            "attribute_path": ["kms_key_name"],
            "values": invalid_kms_key_names,
            "policy_type": "blacklist",
        },
    ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
