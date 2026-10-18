package terraform.gcp.security.dataplex.google_dataplex_asset.discovery_spec_enabled

import data.terraform.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_asset.vars

conditions := [
    [
        {
            "situation_description": "If the discovery_spec.enabled attribute is not set to 'true', the Dataplex asset may not have discovery enabled.",
            "remedies": ["Set the 'discovery_spec.enabled' attribute to 'true'."]
        },
        {
            "condition": "check if the discovery_spec.enabled attribute is set to 'true'",
            "attribute_path": ["discovery_spec", "enabled"],
            "values": [false],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details