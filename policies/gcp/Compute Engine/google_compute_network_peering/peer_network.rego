package terraform.gcp.security.compute_engine.google_compute_network_peering.peer_network

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_peering.vars

conditions := [
    [
        {
            "situation_description": "Network peering targets a peer network outside the approved project, which may extend the trust boundary to an untrusted VPC.",
            "remedies": ["Set peer_network to a network within an approved project to maintain a controlled trust boundary."]
        },
        {
            "condition": "peer_network must reference a network in an approved project.",
            "attribute_path": ["peer_network"],
            "values": ["projects/*/global/networks/*", [["my-project"], ["peer-network"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details