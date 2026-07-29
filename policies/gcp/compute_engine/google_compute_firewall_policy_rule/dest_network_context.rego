package terraform.gcp.security.compute_engine.google_compute_firewall_policy_rule.dest_network_context
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_firewall_policy_rule.vars

conditions := [
  [
    {
      "situation_description": "dest_network_context is set to INTERNET, the broadest possible destination scope, which may unintentionally widen the rule's exposure",
      "remedies": [
        "Set dest_network_context to a narrower value such as VPC_NETWORKS or INTRA_VPC unless internet-wide destination matching is genuinely required"
      ]
    },
    {
      "condition": "dest_network_context must not be INTERNET",
      "attribute_path": ["match", "dest_network_context"],
      "policy_type": "blacklist",
      "values": ["INTERNET"]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
