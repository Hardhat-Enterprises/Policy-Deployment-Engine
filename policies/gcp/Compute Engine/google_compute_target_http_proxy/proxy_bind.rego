package terraform.gcp.security.compute_engine.google_compute_target_http_proxy.proxy_bind

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_target_http_proxy.vars

conditions := [
    [
        {
            "situation_description": "Target HTTP Proxy has proxy_bind enabled",
            "remedies": [
                "Set proxy_bind to false unless explicitly required"
            ]
        },
        {
            "condition": "Proxy bind should not be enabled",
            "attribute_path": ["proxy_bind"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
