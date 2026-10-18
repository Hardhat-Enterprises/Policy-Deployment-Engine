package terraform.gcp.security.compute_engine.google_compute_region_network_endpoint_group.network_endpoint_type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_endpoint_group.vars

conditions := [
	[
		{
			"situation_description": "The endpoint group forwards load balancer traffic to arbitrary external backends outside the organisation's control.",
			"remedies": ["Set network_endpoint_type to SERVERLESS, PRIVATE_SERVICE_CONNECT or GCE_VM_IP_PORTMAP so traffic stays on Google-managed or private paths."]
		},
		{
			"condition": "network_endpoint_type sends traffic to internet backends",
			"attribute_path": ["network_endpoint_type"],
			"values": ["INTERNET_IP_PORT", "INTERNET_FQDN_PORT"],
			"policy_type": "blacklist"
		}
	]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
