package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.app_engine_http_target_relative_uri

import data.terraform.helpers
import data.terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

conditions := [
    [
        {
            "situation_description": "app_engine_http_target is using a http_method that can be exploited, and or not configred service and or is using relative uri with sensitive information",
            "remedies": ["Configure app_engine_http_target correctly with allowed http_method, configured service and relative uri without senstiive information"]
        },
        {
            "condition": "Http_method is using an banned method",
            "attribute_path": ["app_engine_http_target", 0, "http_method"],
            "values": ["DELETE", "PUT", "PATCH"],
            "policy_type": "blacklist"
        },
        {
            "condition": "Service is not designated",
            "attribute_path": ["app_engine_http_target", 0, "app_engine_routing", "service"],
            "values": [null, ""],
            "policy_type": "blacklist"
        },
        {
            "condition": "Relative uri is using banned sensitive information",
            "attribute_path": ["app_engine_http_target", 0, "relative_uri"],
            "values": ["/*", [["password", "token", "api-key"]]],
            "policy_type": "pattern blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
