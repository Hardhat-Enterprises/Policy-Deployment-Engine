package terraform.gcp.security.compute_engine.google_compute_node_group.share_settings_share_type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_node_group.vars

conditions := [
    [
        {
            "situation_description": "The compute node group is configured with an excessively broad infrastructure sharing scope.",
            "remedies": [
                "Restrict node group sharing to LOCAL or SPECIFIC_PROJECTS.",
                "Use SPECIFIC_PROJECTS only where cross-project access is explicitly required and authorised.",
                "Avoid organisation-wide sharing unless it has been reviewed and approved as a documented infrastructure requirement."
            ]
        },
        {
            "condition": "Require node group sharing to remain within an explicitly controlled access boundary.",
            "attribute_path": ["share_settings", 0, "share_type"],
            "values": [
                "LOCAL",
                "SPECIFIC_PROJECTS"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
