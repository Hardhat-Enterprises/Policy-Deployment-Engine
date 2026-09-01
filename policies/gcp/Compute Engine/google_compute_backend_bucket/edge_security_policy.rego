package terraform.gcp.security.compute_engine.google_compute_backend_bucket.edge_security_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_backend_bucket.vars

conditions := [
    [
        {
            "situation_description": "The Backend Bucket does not have an edge security policy attached.",
            "remedies": [
                "Set edge_security_policy to a valid Cloud Armor edge security policy reference."
            ]
        },
        {
            "condition": "An edge security policy must be configured for the Backend Bucket.",
            "attribute_path": ["edge_security_policy"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details