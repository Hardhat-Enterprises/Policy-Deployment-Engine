package terraform.gcp.security.compute_engine.google_compute_interconnect.macsec_fail_open

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_interconnect.vars

conditions := [
    [
        {
            "situation_description": "MACsec is configured to fail open, silently falling back to cleartext traffic.",
            "remedies": [
                "Set macsec.fail_open to false.",
                "A must-secure policy (fail_open = false) drops traffic instead of sending it unencrypted when the MACsec session can't be established."
            ]
        },
        {
            "condition": "macsec.fail_open must not be true",
            "attribute_path": ["macsec", 0, "fail_open"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
