package terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.linked_vpn_tunnels_uris

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Center spoke contains an unapproved VPN tunnel",
		"remedies": ["Link the spoke only to approved VPN tunnel resources"],
	},
	{
		"condition": "Linked VPN tunnels must be approved",
		"attribute_path": ["linked_vpn_tunnels", 0, "uris"],
		"values": ["projects/approved-network-project/regions/us-central1/vpnTunnels/approved-vpn-tunnel"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
