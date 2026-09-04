package terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.cipher_suite_phase1_prf
import data.terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "IKE phase 1 key derivation uses a weak pseudo-random function based on MD5 or SHA1.",
                "remedies": ["Restrict prf to PRF-HMAC-SHA2-256 or stronger."],
        },
        {
                "condition": "cipher_suite.phase1.prf includes a weak algorithm",
                "attribute_path": ["cipher_suite", 0, "phase1", 0, "prf"],
                "values": ["PRF-HMAC-MD5", "PRF-HMAC-SHA1"],
                "policy_type": "element blacklist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
