package terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.cipher_suite_phase1_integrity
import data.terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "IKE phase 1 offers a weak integrity algorithm such as MD5 or SHA1.",
                "remedies": ["Restrict phase1 integrity to HMAC-SHA2-256-128 or stronger."],
        },
        {
                "condition": "cipher_suite.phase1.integrity includes a weak algorithm",
                "attribute_path": ["cipher_suite", 0, "phase1", 0, "integrity"],
                "values": ["HMAC-MD5-96", "HMAC-SHA1-96"],
                "policy_type": "element blacklist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
