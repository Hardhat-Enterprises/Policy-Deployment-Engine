package terraform.gcp.security.cloud_tpu.google_tpu_v2_queued_resource.allowed_parent

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tpu.google_tpu_v2_queued_resource.vars

conditions := [
    [
        {
            "situation_description": "The parent location is not in the allowed list.",
            "remedies": [
                "Use an approved parent location such as 'projects/my-project-name/locations/us-central1-c'.",
                "Consult Google Cloud TPU documentation for supported locations."
            ]
        },
        {
            "condition": "Check if parent is not in the allowed whitelist",
            "attribute_path": ["tpu", 0, "node_spec", 0, "parent"],
            "values": ["projects/my-project-name/locations/us-central1-c"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details