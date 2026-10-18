package terraform.gcp.security.compute_engine.google_compute_interconnect_attachment.ipsec_internal_addresses
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_interconnect_attachment.vars

conditions := [[
  {
    "situation_description": "IPSEC attachment has no reserved internal addresses, so the VPN IP comes from the public pool.",
    "remedies": ["Provide a non-empty ipsec_internal_addresses list when encryption is IPSEC."],
  },
  {
    "condition": "encryption is IPSEC.",
    "attribute_path": ["encryption"],
    "values": ["IPSEC"],
    "policy_type": "whitelist",
  },
  {
    "condition": "ipsec_internal_addresses is empty or missing.",
    "attribute_path": ["ipsec_internal_addresses"],
    "values": [null, "", []],
    "policy_type": "blacklist",
  },
]]


summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
