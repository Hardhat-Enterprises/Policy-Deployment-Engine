package terraform.gcp.security.dataform.google_dataform_repository.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository as repo

# Disallow FORCE deletion policy on Dataform repositories.
# One simple situation: any repo with deletion_policy == "FORCE" is non-compliant.

conditions := [
  [
    {
      "situation_description": "Dataform repository uses FORCE deletion policy (cascades child deletions).",
      "remedies": [
        "Set deletion_policy to DELETE to prevent cascading removal of child resources.",
        "If teardown is intended, run a controlled change with break-glass approval."
      ]
    },
    {
      "condition": "FORCE is not allowed",
      "attribute_path": ["deletion_policy"],
      "policy_type": "blacklist",
      "values": ["FORCE"]
    }
  ]
]

message := helpers.get_multi_summary(conditions, repo.variables).message
details := helpers.get_multi_summary(conditions, repo.variables).details
