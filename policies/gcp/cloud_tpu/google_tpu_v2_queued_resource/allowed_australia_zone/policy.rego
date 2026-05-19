package terraform.gcp.security.cloud_tpu.google_tpu_v2_queued_resource.allowed_australia_zone

import future.keywords.if
import data.terraform.helpers as helpers
import data.terraform.gcp.security.cloud_tpu.google_tpu_v2_queued_resource.vars

conditions := [
    [
        {
            "situation_description": "The Cloud TPU V2 Queued Resource is deployed outside approved Australia regions, which may violate data residency and governance requirements.",
            "remedies": [
                "Set `zone` to an approved Australia zone such as `australia-southeast1-a`, `australia-southeast1-b`, `australia-southeast1-c`, `australia-southeast2-a`, `australia-southeast2-b`, or `australia-southeast2-c`."
            ]
        },
        {
            "condition": "Check if the queued resource zone is in an approved Australia region",
            "attribute_path": ["zone"],
            "values": [
                "australia-southeast1-a",
                "australia-southeast1-b",
                "australia-southeast1-c",
                "australia-southeast2-a",
                "australia-southeast2-b",
                "australia-southeast2-c"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details