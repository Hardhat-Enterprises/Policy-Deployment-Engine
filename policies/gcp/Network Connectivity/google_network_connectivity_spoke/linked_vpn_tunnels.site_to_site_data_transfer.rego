package terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.linked_vpn_tunnels_site_to_site_data_transfer

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "Site-to-site data transfer is enabled for linked VPN tunnels",
		"remedies": ["Disable site-to-site data transfer unless it has been explicitly approved"],
	},
	{
		"condition": "Site-to-site data transfer must be disabled",
		"attribute_path": ["linked_vpn_tunnels", 0, "site_to_site_data_transfer"],
		"values": [false],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
