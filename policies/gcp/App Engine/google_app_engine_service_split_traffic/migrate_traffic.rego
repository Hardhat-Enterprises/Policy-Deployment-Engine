package terraform.gcp.security.app_engine.google_app_engine_service_split_traffic.migrate_traffic

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_service_split_traffic.vars

conditions := [
    [
        {
            "situation_description": "Traffic is being migrated immediately, bypassing the split configuration",
            "remedies": ["Have migrate_traffic set to 'false' to respect the defined version allocations"]
        },
        {
            "condition": "ensure traffic split is respected",
            "attribute_path": ["migrate_traffic"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details