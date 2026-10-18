package terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.ike_version
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_vpn_tunnel.vars
conditions := [
    [
    {
      "situation_description": "The VPN tunnel negotiates with IKEv1, an older protocol version with weaker cryptographic negotiation than IKEv2.",
      "remedies": ["Set ike_version to 2 so the tunnel negotiates using IKEv2."]
    },
    {
      "condition": "ike_version is not 2",
      "attribute_path": ["ike_version"],
      "values": [2],
      "policy_type": "whitelist"
    }
  ]
]
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
