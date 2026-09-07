package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.http_target_oidc_token_audience

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

# Example platform-approved domain. Replace with the organisation's
# actual approved domain before production deployment.
approved_audience_pattern := "^https://([a-zA-Z0-9-]+\\.)*example\\.com(:[0-9]+)?(/.*)?$"

conditions := [
    [
        {
            "situation_description": "The OIDC token audience is missing or is not an approved HTTPS target.",
            "remedies": [
                "Set the audience to an HTTPS URL under an organisation-approved domain.",
                "Maintain approved audience domains in the platform security baseline."
            ]
        },
        {
            "condition": "Check whether the OIDC audience is missing or empty.",
            "attribute_path": ["http_target", 0, "oidc_token", 0, "audience"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

audience_violations := {name |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
    name := resource.values.name

    audience := object.get(
        object.get(
            object.get(resource.values, "http_target", [{}])[0],
            "oidc_token",
            [{}]
        )[0],
        "audience",
        null
    )

    not valid_audience(audience)
}

valid_audience(audience) if {
    is_string(audience)
    regex.match(approved_audience_pattern, audience)
}

message := array.concat(
    result.message,
    [sprintf(
        "Situation 2: The OIDC token audience must use HTTPS and an approved domain. Non-Compliant Resources: %s",
        [concat(", ", sort([name | name := audience_violations[_]]))]
    )]
) if {
    count(audience_violations) > 0
} else := result.message

details := result.details