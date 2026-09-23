package terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.shared_secret

import data.terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "The IKE pre-shared key is empty or set to a trivially guessable placeholder value, weakening authentication of the VPN peer.",
                "remedies": ["Supply a long, randomly generated shared_secret sourced from a secret manager rather than a literal in the Terraform code."],
        },
        {
                "condition": "shared_secret is empty or a known weak placeholder",
                "attribute_path": ["shared_secret"],
                "values": ["", "password", "changeme", "secret", "test", "12345678"],
                "policy_type": "blacklist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
