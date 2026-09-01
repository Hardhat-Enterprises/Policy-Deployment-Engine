package terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.linked_interconnect_attachments_uris

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Center spoke contains an unapproved Interconnect attachment",
		"remedies": ["Link the spoke only to approved Interconnect attachment resources"],
	},
	{
		"condition": "Linked Interconnect attachments must be approved",
		"attribute_path": ["linked_interconnect_attachments", 0, "uris"],
		"values": ["projects/approved-network-project/regions/us-central1/interconnectAttachments/approved-attachment"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
