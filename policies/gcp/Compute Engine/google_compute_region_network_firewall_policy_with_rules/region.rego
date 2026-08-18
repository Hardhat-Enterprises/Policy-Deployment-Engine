package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.region
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.vars as vars
conditions := [[
	{
		"situation_description": "The region of the firewall policy must be specified and be in the approved location.",
		"remedies": ["Change the region attribute to either australia-southeast1 or australia-southeast2."],
	},
	{
		"condition": "Ensure that the region attribute is set to either australia-southeast1 or australia-southeast2.",
		"attribute_path": ["region"],
		"values": ["australia-southeast1", "australia-southeast2"],
		"policy_type": "whitelist",
	},
]]

   
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
