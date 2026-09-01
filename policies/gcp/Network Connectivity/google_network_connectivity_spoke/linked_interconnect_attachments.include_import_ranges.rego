package terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.linked_interconnect_attachments_include_import_ranges

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Center Interconnect spoke imports an unapproved route range",
		"remedies": [
			"Restrict Interconnect spoke import ranges to approved IPv4 CIDR ranges",
			"Do not use ALL_IPV4_RANGES unless explicitly approved",
		],
	},
	{
		"condition": "Interconnect attachment import ranges must be approved",
		"attribute_path": ["linked_interconnect_attachments", 0, "include_import_ranges"],
		"values": ["10.0.0.0/8"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
