package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.private_service_connect_config_project_allowlist

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure private service connect project allowlist exists and is not empty.",
            "remedies": ["Provide a non-empty `project_allowlist`."]
        },
        {
            "condition": "project_allowlist is missing or empty",
            "attribute_path": ["private_service_connect_config", 0, "project_allowlist"],
            "values": [null, []],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Ensure project_allowlist is not overly broad.",
            "remedies": ["Remove wildcard entries from the allowlist."]
        },
        {
            "condition": "project_allowlist contains a wildcard",
            "attribute_path": ["private_service_connect_config", 0, "project_allowlist"],
            "values": ["*"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details