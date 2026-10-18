package terraform.gcp.security.compute_engine.google_compute_subnetwork.log_config_metadata_fields

import data.terraform.helpers
import data.terraform.helpers.shared
import data.terraform.gcp.security.compute_engine.google_compute_subnetwork.vars

situation := "Custom flow log metadata is enabled without any metadata fields"
remedies := ["Add at least one value to log_config.metadata_fields"]

conditions := [[
    {
        "situation_description": situation,
        "remedies": remedies
    },
    {
        "condition": "Custom metadata must include at least one metadata field",
        "attribute_path": ["log_config", 0, "metadata_fields"],
        "values": [null, []],
        "policy_type": "blacklist"
    }
]]

missing_metadata_fields(value) if {
    value == null
}

missing_metadata_fields(value) if {
    is_array(value)
    count(value) == 0
}

non_compliant_resources := {name |
    some resource in input.planned_values.root_module.resources
    resource.type == vars.variables.resource_type

    some log_config in resource.values.log_config
    log_config.metadata == "CUSTOM_METADATA"
    missing_metadata_fields(object.get(log_config, "metadata_fields", null))

    name := shared.get_resource_attribute(
        resource,
        vars.variables.resource_value_name
    )
}

resource_count := count([resource |
    some resource in input.planned_values.root_module.resources
    resource.type == vars.variables.resource_type
])

results := [{
    "situation": situation,
    "remedies": remedies,
    "non_compliant_resources": non_compliant_resources,
    "conditions": []
}]

message := helpers.format_summary_messages(
    vars.variables.friendly_resource_name,
    resource_count,
    results
)

details := results
