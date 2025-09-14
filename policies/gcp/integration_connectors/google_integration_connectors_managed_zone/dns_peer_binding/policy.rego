package terraform.gcp.security.integration_connectors.google_integration_connectors_managed_zone.dns_peer_binding
import data.terraform.gcp.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_managed_zone.vars

conditions := [[
	{
		"situation_description": "securing the access to DNS Peer role",
		"remedies": ["Restrict access to DNS Peer role using IAM roles"],
	},
	{
		"condition": "Test if access to DNS Peer role is restricted",
		"attribute_path": ["service_attachment"],
		"values": ["serviceAccount:service-@gcp-sa-connectors.iam.gserviceaccount.com"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details