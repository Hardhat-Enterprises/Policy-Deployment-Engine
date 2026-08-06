package terraform.gcp.security.dataplex.google_dataplex_zone.discovery_spec.enabled

import data.terraform.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_zone.vars

conditions := [
    [
        {
            "situation_description": "If the discovery_spec.enabled attribute is not set to 'true', the Dataplex Zone may not have discovery enabled.",
            "remedies": ["Set the 'discovery_spec.enabled' attribute to 'true'."]
        },
        {
            "condition": "check if the discovery_spec.enabled attribute is set to 'true'",
            "attribute_path": ["discovery_spec", "enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details