package terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.cipher_suite_phase1_dh
import data.terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "IKE phase 1 key exchange offers a legacy Diffie-Hellman group with insufficient key strength.",
                "remedies": ["Restrict dh to Group-14 or higher (e.g. Group-14, Group-15, Group-16)."],
        },
        {
                "condition": "cipher_suite.phase1.dh includes a weak algorithm",
                "attribute_path": ["cipher_suite", 0, "phase1", 0, "dh"],
                "values": ["Group-2", "Group-5"],
                "policy_type": "element blacklist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
