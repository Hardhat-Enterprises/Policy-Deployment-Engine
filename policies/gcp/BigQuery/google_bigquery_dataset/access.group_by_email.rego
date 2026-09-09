package terraform.gcp.security.bigquery.google_bigquery_dataset.access_group_by_email

import data.terraform.gcp.security.bigquery.google_bigquery_dataset.vars

conditions := [
    [
        {
            "situation_description": "A dataset access entry grants a Google Group outside the organisation's approved domains, so dataset contents can reach members the dataset owner does not control.",
            "remedies": [
                "Grant a Google Group in a domain the organisation owns and controls",
                "Or remove the entry if the external group does not need access"
            ]
        },
        {
            "condition": "Require group email addresses to use an approved organisational domain",
            "attribute_path": ["access", "group_by_email"],
            "values": vars.variables.approved_domains,
            "policy_type": "whitelist"
        }
    ]
]

approved_email(email) if {
    some domain in vars.variables.approved_domains
    endswith(lower(email), sprintf("@%s", [lower(domain)]))
}

non_compliant_resources := {
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type

    access_blocks := object.get(resource.values, "access", [])
    some access_block in access_blocks

    email := object.get(access_block, "group_by_email", null)
    email != null
    email != ""
    not approved_email(email)
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
        conditions[0][0].situation_description,
        sprintf(
            "Non-Compliant Resources: %s",
            [concat(", ", display_names)]
        ),
        sprintf(
            "Potential Remedies: %s",
            [concat(", ", conditions[0][0].remedies)]
        )
    ]
]

details := [
    {
        "situation": conditions[0][0].situation_description,
        "remedies": conditions[0][0].remedies,
        "non_compliant_resources": non_compliant_names,
        "conditions": [conditions[0][1]]
    }
]