package terraform.gcp.security.compute_engine.google_compute_subnetwork.log_config_metadata

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_subnetwork.vars

conditions := [[
    {
        "situation_description": "VPC flow logs do not include metadata",
        "remedies": ["Set log_config.metadata to INCLUDE_ALL_METADATA or CUSTOM_METADATA"]
    },
    {
        "condition": "Flow log metadata must be included",
        "attribute_path": ["log_config", 0, "metadata"],
        "values": ["INCLUDE_ALL_METADATA", "CUSTOM_METADATA"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
