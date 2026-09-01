package terraform.gcp.security.BigQuery.google_bigquery_dataset.access_condition_expression

import data.terraform.gcp.security.BigQuery.google_bigquery_dataset.vars

unsafe_expression(expression) if {
    bad_value := ["", "true", "1 == 1"][_]
    expression == bad_value
}

non_compliant_resources := {
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type

    access_blocks := object.get(resource.values, "access", [])
    some access_block in access_blocks

    condition_blocks := object.get(access_block, "condition", [])
    some condition_block in condition_blocks

    expression := object.get(condition_block, "expression", null)
    expression != null
    unsafe_expression(expression)
}

non_compliant_names := {
    resource_name |
    some resource in non_compliant_resources
    resource_name := object.get(
        resource.values,
        vars.variables.resource_value_name,
        "unknown"
    )
}

resource_count := count([
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
])

display_names := sort(non_compliant_names) if {
    count(non_compliant_names) > 0
} else := ["All passed"]

message := [
    sprintf(
        "Total %s detected: %d ",
        [vars.variables.friendly_resource_name, resource_count]
    ),
    [
        "Situation 1: A dataset access condition uses an empty or unconditional expression, causing the access binding to apply without a meaningful restriction.",
        sprintf(
            "Non-Compliant Resources: %s",
            [concat(", ", display_names)]
        ),
        "Potential Remedies: Replace the unconditional expression with a meaningful CEL condition that restricts when the access binding applies"
    ]
]

details := [
    {
        "situation": "A dataset access condition uses an empty or unconditional expression, causing the access binding to apply without a meaningful restriction.",
        "remedies": [
            "Replace the unconditional expression with a meaningful CEL condition that restricts when the access binding applies"
        ],
        "non_compliant_resources": non_compliant_names,
        "conditions": []
    }
]
