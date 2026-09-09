package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_storage_pool.kms_config

import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_storage_pool.vars
import data.terraform.helpers

kms_config_pattern := `^projects/[^/]+/locations/[^/]+/kmsConfigs/[^/]+$`

valid_kms_config(value) if {
    is_string(value)
    regex.match(kms_config_pattern, value)
}

conditions := [
    [
        {
            "situation_description": "The NetApp Storage Pool does not use a structurally valid customer-managed KMS configuration.",
            "remedies": [
                "Set kms_config using projects/{project}/locations/{location}/kmsConfigs/{name}.",
            ],
        },
        {
            "condition": "A NetApp KMS configuration must be configured.",
            "attribute_path": ["kms_config"],
            "values": [null, ""],
            "policy_type": "blacklist",
        },
    ],
]



violations := [
{
    "name": resource_name,
    "message": sprintf(
        "NetApp Storage Pool '%s' must set kms_config to a valid NetApp KMS configuration path.",
        [resource_name],
    ),
} |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
    value := object.get(resource.values, "kms_config", null)
    not valid_kms_config(value)
    resource_name := object.get(resource.values, vars.variables.resource_value_name, resource.name)
]

non_compliant_resource_names := {
violation.name |
    some violation in violations
}

resource_count := count([
resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
])

situation_results := [
    {
        "situation": "The NetApp Storage Pool does not use a structurally valid customer-managed KMS configuration.",
        "remedies": [
            "Set kms_config using projects/{project}/locations/{location}/kmsConfigs/{name}.",
        ],
        "non_compliant_resources": non_compliant_resource_names,
        "conditions": [
            {
                "NetApp KMS configuration must use the required resource path": violations,
            },
        ],
    },
]

message := helpers.format_summary_messages(
    vars.variables.friendly_resource_name,
    resource_count,
    situation_results,
)

details := situation_results