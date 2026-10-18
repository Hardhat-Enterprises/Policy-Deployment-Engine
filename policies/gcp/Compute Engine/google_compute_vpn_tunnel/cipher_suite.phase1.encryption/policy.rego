package terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.cipher_suite_phase1_encryption
import data.terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "IKE phase 1 offers a weak encryption algorithm such as 3DES, which is deprecated.",
                "remedies": ["Restrict phase1 encryption to AES-CBC-256 or an AES-GCM variant."],
        },
        {
                "condition": "cipher_suite.phase1.encryption includes a weak algorithm",
                "attribute_path": ["cipher_suite", 0, "phase1", 0, "encryption"],
                "values": ["3DES-CBC"],
                "policy_type": "element blacklist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
