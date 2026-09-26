package terraform.gcp.security.compute_engine.google_compute_firewall.log_config_metadata

import data.terraform.gcp.security.compute_engine.google_compute_firewall.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "Firewall logs exclude metadata, so investigators lack the context needed to trace a connection back to its source.",
                "remedies": ["Set log_config.metadata to INCLUDE_ALL_METADATA so logs carry full connection context."],
        },
        {
                "condition": "log_config.metadata is not INCLUDE_ALL_METADATA",
                "attribute_path": ["log_config", 0, "metadata"],
                "values": ["INCLUDE_ALL_METADATA"],
                "policy_type": "whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
