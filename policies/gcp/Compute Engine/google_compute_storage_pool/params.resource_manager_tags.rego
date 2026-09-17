package terraform.gcp.security.compute_engine.google_compute_storage_pool.params_resource_manager_tags

import data.terraform.gcp.security.compute_engine.google_compute_storage_pool.vars
import data.terraform.helpers

conditions := [
    [
        {
            "situation_description": "The Storage Pool does not have the required security Resource Manager tag.",
            "remedies": [
                "Add a Resource Manager security tag with a key ending in '/security' and value 'required'.",
            ],
        },
        {
            "condition": "Resource Manager tags must be configured.",
            "attribute_path": ["params", 0, "resource_manager_tags"],
            "values": [null, {}],
            "policy_type": "blacklist",
        },
    ],
]

security_tag_key_pattern := `^.*/security$`

valid_security_resource_manager_tags(tags) if {
    is_object(tags)
    some tag_key, tag_value in tags
    regex.match(security_tag_key_pattern, tag_key)
    tag_value == "required"
}

violations := [
    {
        "name": resource_name,
        "message": sprintf(
            "Storage Pool '%s' must have a Resource Manager security tag with a key ending in '/security' and value 'required'.",
            [resource_name],
        ),
    } |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type

    tags := object.get(
        resource.values,
        ["params", 0, "resource_manager_tags"],
        {},
    )

    not valid_security_resource_manager_tags(tags)

    resource_name := object.get(
        resource.values,
        vars.variables.resource_value_name,
        resource.name,
    )
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
        "situation": "The Storage Pool does not have the required security Resource Manager tag.",
        "remedies": [
            "Add a Resource Manager security tag with a key ending in '/security' and value 'required'.",
        ],
        "non_compliant_resources": non_compliant_resource_names,
        "conditions": [
            {
                "Resource Manager security tag must have a key ending in '/security' and value 'required'": violations,
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