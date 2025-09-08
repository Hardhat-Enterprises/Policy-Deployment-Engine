package terraform.gcp.security.dataform.google_dataform_repository.iam_no_public
import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.iam_no_public.vars

conditions := [
  [
    {
      "situation_description": "Dataform repository IAM binding includes overly broad principals.",
      "remedies": ["Remove allUsers/allAuthenticatedUsers from members and grant least privilege."]
    },
    {
      "condition": "Public principals must not be present in members",
      "attribute_path": ["members"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


