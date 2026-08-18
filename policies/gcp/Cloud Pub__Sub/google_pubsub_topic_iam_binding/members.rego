package terraform.gcp.security.cloud_pub_sub.google_pubsub_topic_iam_binding.members

import data.terraform.helpers
import data.terraform.gcp.security.cloud_pub_sub.google_pubsub_topic_iam_binding.vars

conditions := [
  [
    {"situation_description": "Pub/Sub Topic IAM Binding grants access to public principals (allUsers or allAuthenticatedUsers).",
     "remedies": [
       "Remove 'allUsers' and 'allAuthenticatedUsers' from the members list.",
       "Use specific service accounts, groups, or user identities instead.",
       "Apply the principle of least privilege — only grant access to known, authenticated identities."
     ]},
    {
      "condition": "members must not contain allUsers or allAuthenticatedUsers.",
      "attribute_path": ["members"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "element blacklist"
    }
  ]
]

result = helpers.get_multi_summary(conditions, vars.variables)
message = result.message
details = result.details
