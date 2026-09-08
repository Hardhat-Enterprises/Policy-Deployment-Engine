package terraform.gcp.security.compute_engine.google_compute_service_attachment.show_nat_ips # Edit here 
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_service_attachment.vars

conditions := [
    [
        {
            "situation_description": "show_nat_ips is configured to an exposing setting",
            "remedies": [
                "Configure show_nat_ips to false",
            ]
        },
        {
            "condition": "show_nat_ips should be configured to false",
            "attribute_path": ["show_nat_ips"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details