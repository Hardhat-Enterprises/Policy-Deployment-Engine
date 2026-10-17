package terraform.gcp.security.compute_engine.google_compute_router_peer.md5_authentication_key_name

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_router_peer.vars

conditions := [[
  {
    "situation_description": "Cloud Router BGP Peer does not enable MD5 authentication, leaving the BGP session unauthenticated and open to spoofing or route injection.",
    "remedies": [
      "Add an md5_authentication_key block to the BGP peer.",
      "Set md5_authentication_key.name to the name of a key defined in the Cloud Router's md5_authentication_keys.",
    ],
  },
  {
    "condition": "md5_authentication_key.name must be set (BGP session must be authenticated).",
    "attribute_path": ["md5_authentication_key", "name"],
    "values": [null, ""],
    "policy_type": "blacklist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
