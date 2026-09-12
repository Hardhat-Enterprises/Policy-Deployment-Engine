package terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.cipher_suite_phase2_encryption
import data.terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "IKE phase 2 protects tunnel traffic with a weak encryption algorithm such as 3DES.",
                "remedies": ["Restrict phase2 encryption to AES-CBC-128 or stronger."],
        },
        {
                "condition": "cipher_suite.phase2.encryption includes a weak algorithm",
                "attribute_path": ["cipher_suite", 0, "phase2", 0, "encryption"],
                "values": ["3DES-CBC"],
                "policy_type": "element blacklist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
