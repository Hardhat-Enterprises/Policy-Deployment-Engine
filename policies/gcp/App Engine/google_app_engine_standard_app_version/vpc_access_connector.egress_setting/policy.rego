package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vpc_access_connector_egress_setting

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine outbound traffic can bypass the VPC connector",
            "remedies": ["set 'vpc_access_connector.egress_setting' to 'ALL_TRAFFIC'"]
        },
        {
            "condition": "Require all outbound traffic to use the VPC connector",
            "attribute_path": ["vpc_access_connector", 0, "egress_setting"],
            "values": ["ALL_TRAFFIC"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details