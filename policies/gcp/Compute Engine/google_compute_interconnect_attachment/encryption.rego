package terraform.gcp.security.compute_engine.google_compute_interconnect_attachment.encryption

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_interconnect_attachment.vars

conditions := [[
  {
    "situation_description": "Interconnect Attachment carries unencrypted traffic; the default 'NONE' encryption allows cleartext over the VLAN attachment.",
    "remedies": [
      "Set encryption to IPSEC so the attachment only carries IPsec-encrypted traffic.",
    ],
  },
  {
    "condition": "encryption must be IPSEC.",
    "attribute_path": ["encryption"],
    "values": ["IPSEC"],
    "policy_type": "whitelist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
