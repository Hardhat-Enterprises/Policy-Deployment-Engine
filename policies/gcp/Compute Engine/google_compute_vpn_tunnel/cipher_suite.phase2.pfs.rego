package terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.cipher_suite_phase2_pfs
import data.terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "Perfect Forward Secrecy uses a legacy group, so a future key compromise could expose past sessions.",
                "remedies": ["Restrict pfs to Group-14 or higher."],
        },
        {
                "condition": "cipher_suite.phase2.pfs includes a weak algorithm",
                "attribute_path": ["cipher_suite", 0, "phase2", 0, "pfs"],
                "values": ["Group-2", "Group-5"],
                "policy_type": "element blacklist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
