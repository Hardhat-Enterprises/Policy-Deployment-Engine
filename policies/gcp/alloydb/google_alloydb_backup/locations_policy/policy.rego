package terraform.gcp.security.alloydb.google_alloydb_backup.location

import data.terraform.gcp.helpers as helpers

conditions := [
  [
    {
      "situation_description": "Backup location must be specified.",
      "remedies": ["Set the `location` field to an approved region."]
    },
    {
      "condition": "Location must be present (not null/empty).",
      "attribute_path": ["location"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Backup location must be in the approved region allowlist.",
      "remedies": ["Use one of: us-central1, us-east1."]
    },
    {
      "condition": "Location must be on the allowlist.",
      "attribute_path": ["location"],
      "values": ["us-central1", "us-east1"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, {"friendly_resource_name": "AlloyDB Backup"}).message
details := helpers.get_multi_summary(conditions, {"friendly_resource_name": "AlloyDB Backup"}).details
