package terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.tls_inspect
import data.terraform.helpers 
import data.terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.vars

conditions := [
    [
    {
      "situation_description": "TLS inspection is not enabled, so encrypted traffic reaches the security profile without being decrypted",
      "remedies": ["Set tls_inspect to true to decrypted and is inspected by the security profile group"]
    },
    {
      "condition": "tls_inspect is true",
      "attribute_path": ["tls_inspect"],
    "values": [true],
    "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details