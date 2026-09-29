package terraform.gcp.security.compute_engine.google_compute_target_https_proxy.quic_override

import data.terraform.gcp.security.compute_engine.google_compute_target_https_proxy.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Target HTTPS proxy quic_override enables QUIC negotiation, which prioritises performance over strong, well-vetted TLS enforcement.",
      "remedies": [
        "Set quic_override to DISABLE to keep connections on standard TLS.",
      ],
    },
    {
      "condition": "quic_override must be DISABLE.",
      "attribute_path": ["quic_override"],
      "values": [
        "DISABLE",
      ],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
