package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.destination_project
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_channel.vars

# policy_lint reports hard-coded-value on the value below, and the finding stands.
# A pattern whitelist only judges values that MATCH its target: one that does not
# match the shape is never flagged at all. This argument's non-compliant example
# is a bare project name with no "projects/" prefix, so converting would make the fixture pass for the wrong
# reason. Either _helpers needs a pattern whitelist that fails a non-matching
# value, or the fixture needs a wrongly-scoped (not malformed) example.
conditions := [
  [
    {
      "situation_description": "Restore Channel destination_project must be in australia-southeast1.",
      "remedies": ["Set destination_project to a location in australia-southeast1."]
    },
    {
      "condition": "Destination project must be 'projects/PDE'",
      "attribute_path": ["destination_project"],
      "values": ["projects/PDE"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
