package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan_iam_binding.members

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan_iam_binding.vars

# Merged policy for `members` — 6 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
conditions := [
[
    {
      "situation_description": "Restore Plan IAM members must not contain cross-project groups.",
      "remedies": ["Remove cross-project groups (ext-, external-, partner-)."]
    },
    {
      "condition": "Members must not be cross-project groups",
      "attribute_path": ["members"],
      "values": ["@ext-", "@external-", "@partner-"],
      "policy_type": "element_blacklist"
    }
  ],
[
    {
      "situation_description": "Restore operations must be restricted to corporate accounts.",
      "remedies": ["Remove members with @gmail.com, @hotmail.com, etc."]
    },
    {
      "condition": "Members must not be personal emails",
      "attribute_path": ["members"],
      "values": ["@gmail.com", "@yahoo.com", "@hotmail.com", "@outlook.com", "@live.com"],
      "policy_type": "element_blacklist"
    }
  ],
[
    {
      "situation_description": "Member count check requires valid accounts.",
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
      "situation_description": "Restore Plan IAM members must not correspond to personal email accounts.",
      "remedies": ["Remove members with personal email domains (@gmail.com, etc)."]
    },
    {
      "condition": "Members must not be personal emails",
      "attribute_path": ["members"],
      "values": ["@gmail.com", "@yahoo.com", "@hotmail.com", "@outlook.com"],
      "policy_type": "element_blacklist"
    }
  ],
[
    {
      "situation_description": "Restore Plan IAM must strictly prohibit public access to prevent unauthorized data restoration.",
      "remedies": ["Remove 'allUsers' and 'allAuthenticatedUsers' from IAM bindings."]
    },
    {
      "condition": "Public access forbidden",
      "attribute_path": ["members"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "element_blacklist"
    }
  ],
[
    {
      "situation_description": "Service accounts must not include deleted accounts.",
      "remedies": ["Remove members with 'deleted:' prefix."]
    },
    {
      "condition": "Service accounts must not include deleted accounts",
      "attribute_path": ["members"],
      "values": ["deleted:"],
      "policy_type": "element_blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
