package terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.members

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.vars

# Merged policy for `members` — 3 independent scenarios.
conditions := [
[
    {
      "situation_description": "Backup Plan IAM members must not contain public or personal access.",
      "remedies": ["Remove allUsers, allAuthenticatedUsers, and personal emails."]
    },
    {
      "condition": "Members must not include public/personal access",
      "attribute_path": ["members"],
      "values": ["@gmail.com", "@hotmail.com", "@yahoo.com", "allUsers", "allAuthenticatedUsers"],
      "policy_type": "element_blacklist"
    }
  ],
  [
    {
      "situation_description": "Backup Plan IAM members must not contain deleted accounts.",
      "remedies": ["Remove members with 'deleted:' prefix."]
    },
    {
      "condition": "Members must not include deleted accounts",
      "attribute_path": ["members"],
      "values": ["deleted:"],
      "policy_type": "element_blacklist"
    }
  ],
[
    {
      "situation_description": "Backup Plan IAM members must not correspond to personal email accounts.",
      "remedies": ["Remove members with personal email domains (@gmail.com, etc)."]
    },
    {
      "condition": "Members must not be personal emails",
      "attribute_path": ["members"],
      "values": ["@gmail.com", "@yahoo.com", "@hotmail.com", "@aol.com", "@outlook.com"],
      "policy_type": "element_blacklist"
    }
  ],
[
    {
      "situation_description": "Backup Plan IAM members must not be federated identities.",
      "remedies": ["Remove federated identities."]
    },
    {
      "condition": "Members should not include federated identities",
      "attribute_path": ["members"],
      "values": ["principal://iam.googleapis.com/*", "principalSet://iam.googleapis.com/*"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
