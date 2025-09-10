package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup.approved_vault_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup.vars

conditions := [
  [
    {
      "situation_description": "Backups must use an approved vault",
      "remedies": [
        "Set vault_name to one of the approved vaults (e.g., \"backup-vault\" in Melbourne, \"backup-vault-syd\" in Sydney)."
      ]
    },
    {
      "condition": "vault_name equals an approved vault",
      "attribute_path": ["vault_name"],
      "values": [
        "backup-vault",        # Melbourne
        "backup-vault-syd"     # Sydney
      ],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Vault name must not be empty",
      "remedies": ["Provide a valid approved vault name."]
    },
    {
      "condition": "vault_name must not be empty",
      "attribute_path": ["vault_name"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
