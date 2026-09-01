package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_kmsconfig.crypto_key_name

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_kmsconfig.vars

conditions := [
  [
    {
      "situation_description": "CMEK must use an approved regional key in AU",
      "remedies": [
        "Set crypto_key_name to one of the approved keys below."
      ]
    },
    {
      "condition": "crypto_key_name equals an approved key",
      "attribute_path": ["crypto_key_name"],
      "values": [
        "projects/*/locations/*/keyRings/*/cryptoKeys/*",
        [
          ["deakin-lab-123"],
          ["australia-southeast1", "australia-southeast2"],
          ["netapp-kr"],
          ["netapp-cmek"]
        ]
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
