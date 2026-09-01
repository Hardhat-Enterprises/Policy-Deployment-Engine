package terraform.gcp.security.compute_engine.google_compute_backend_bucket.cdn_policy_signed_url_cache_max_age_sec

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_backend_bucket.vars

conditions := [
    [
        {
            "situation_description": "The Backend Bucket caches signed URL responses beyond the approved one-hour limit.",
            "remedies": [
                "Set cdn_policy.signed_url_cache_max_age_sec between 0 and 3600 seconds."
            ]
        },
        {
            "condition": "Signed URL cache freshness must not exceed 3600 seconds.",
            "attribute_path": ["cdn_policy", 0, "signed_url_cache_max_age_sec"],
            "values": [0, 3600],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details