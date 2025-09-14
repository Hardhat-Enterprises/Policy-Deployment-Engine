package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_kmsconfig.valid_crypto_key_name

import data.terraform.gcp.helpers
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
        "projects/deakin-lab-123/locations/australia-southeast1/keyRings/netapp-kr/cryptoKeys/netapp-cmek",
        "projects/deakin-lab-123/locations/australia-southeast2/keyRings/netapp-kr/cryptoKeys/netapp-cmek"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
