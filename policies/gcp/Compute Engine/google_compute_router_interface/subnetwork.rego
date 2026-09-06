package terraform.gcp.security.compute_engine.google_compute_router_interface.subnetwork

import data.terraform.gcp.security.compute_engine.google_compute_router_interface.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Router interface subnetwork is set to an empty or invalid value.",
      "remedies": [
        "If using subnetwork mode, set subnetwork to a valid subnetwork reference. Interfaces using vpn_tunnel or interconnect_attachment instead do not need subnetwork set.",
      ],
    },
    {
      "condition": "subnetwork, if set, must not be empty or invalid.",
      "attribute_path": ["subnetwork"],
      "values": ["", "invalid-subnetwork"],
      "policy_type": "blacklist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
