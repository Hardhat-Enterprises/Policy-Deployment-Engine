package terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.ip_configuration

import data.terraform.helpers
import data.terraform.gcp.security.data_pipeline.google_data_pipeline_pipeline.vars

conditions := [[
	{
		"situation_description": "If the ip_configuration attribute allows public or unspecified worker IP configurations, Dataflow workers may be exposed to external networks, increasing the risk of unauthorised access or network-based attacks.",
		"remedies": ["Configure ip_configuration to use WORKER_IP_PRIVATE"],
	},
	{
		"condition": "check if the ip_configuration attribute uses private worker IPs.",
        "attribute_path": ["workload", 0, "dataflow_flex_template_request", 0, "launch_parameter", 0, "environment", 0, "ip_configuration"],
		"values": ["WORKER_IP_PUBLIC", "WORKER_IP_UNSPECIFIED"],
		"policy_type": "blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
