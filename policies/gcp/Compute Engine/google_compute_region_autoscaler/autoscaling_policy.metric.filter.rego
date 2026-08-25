package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.autoscaling_policy_metric_filter

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's metric filter is empty or too broad, risking selection of the wrong TimeSeries data and inaccurate scaling decisions.",
            "remedies": [
                "Set metric.filter to a precise, scoped query string.",
                "Ensure the filter selects only the intended TimeSeries.",
                "Avoid leaving metric.filter blank."
            ]
        },
        {
            "condition": "Check if metric filter is explicitly set",
            "attribute_path": ["autoscaling_policy", "metric", "filter"],
            "values": [""],
            "policy_type": "Blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
