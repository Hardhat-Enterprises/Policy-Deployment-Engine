package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_private_cloud.network_config_management_cidr

import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_private_cloud.vars

conditions := [[
        {
                "situation_description": "VMware Engine management CIDR must use an approved private network range.",
                "remedies": ["Set network_config.management_cidr to the approved private CIDR range."],
        },
        {
                "condition": "management_cidr must be an approved private CIDR range",
                "attribute_path": ["network_config", 0, "management_cidr"],
                "values": ["192.168.30.0/24"],
                "policy_type": "whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details