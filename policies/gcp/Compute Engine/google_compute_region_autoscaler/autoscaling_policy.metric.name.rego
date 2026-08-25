package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.autoscaling_policy_metric_name

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's metric name is empty or unset, meaning scaling decisions may be based on a missing or unverified telemetry signal.",
            "remedies": [
                "Set metric.name to a verified, actively-monitored metric identifier.",
                "Confirm the metric is populated and reliable before relying on it for scaling.",
                "Avoid leaving metric.name blank."
            ]
        },
        {
            "condition": "Check if metric name is explicitly set",
            "attribute_path": ["autoscaling_policy", "metric", "name"],
            "values": [""],
            "policy_type": "Blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
