package terraform.gcp.security.compute_engine.google_compute_interconnect.macsec_enabled

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_interconnect.vars

conditions := [
    [
        {
            "situation_description": "MACsec link-layer encryption is not enabled on this Interconnect connection.",
            "remedies": [
                "Set macsec_enabled to true.",
                "Configure a macsec block with at least one pre_shared_keys entry."
            ]
        },
        {
            "condition": "Check if macsec_enabled is enabled.",
            "attribute_path": ["macsec_enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
