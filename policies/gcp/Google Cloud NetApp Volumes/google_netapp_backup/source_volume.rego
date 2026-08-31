package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup.source_volume

import data.terraform.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup.vars

# policy_lint reports hard-coded-value on the value below, and the finding stands.
# A pattern whitelist only judges values that MATCH its target: one that does not
# match the shape is never flagged at all. This argument's non-compliant example
# is the empty string, so converting would make the fixture pass for the wrong
# reason. Either _helpers needs a pattern whitelist that fails a non-matching
# value, or the fixture needs a wrongly-scoped (not malformed) example.
conditions := [
  [
    {
      "situation_description": "Backups must reference an approved volume in the Deakin project and AU regions",
      "remedies": [
        "Set source_volume to one of the approved full IDs below."
      ]
    },
    {
      "condition": "source_volume equals an approved volume ID",
      "attribute_path": ["source_volume"],
      "values": [
        "projects/deakin-lab-123/locations/australia-southeast1/volumes/backup-volume",
        "projects/deakin-lab-123/locations/australia-southeast2/volumes/backup-volume"
      ],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
