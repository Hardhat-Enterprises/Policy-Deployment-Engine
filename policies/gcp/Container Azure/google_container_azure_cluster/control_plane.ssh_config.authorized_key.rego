package terraform.gcp.security.Container_Azure.google_container_azure_cluster.control_plane.ssh_config.authorized_key

import data.terraform.helpers
import data.terraform.gcp.security.Container_Azure.google_container_azure_cluster.vars

conditions := [[
	{
		"situation_description": "If the control_plane.ssh_config.authorized_key attribute is not set to an approved SSH public key, the Container Azure Cluster may allow unauthorized SSH administrative access to control plane VMs.",
		"remedies": ["Set the 'control_plane.ssh_config.authorized_key' attribute to an approved SSH public key."],
	},
	{
		"condition": "Check if the SSH authorized key is an approved SSH public key.",
		"attribute_path": ["control_plane", 0, "ssh_config", 0, "authorized_key"],
		"values": ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDc1234567890== thomasrodgers"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details