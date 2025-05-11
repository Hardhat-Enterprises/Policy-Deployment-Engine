# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_iam_workload_identity_pool_provider" "nc" {
  workload_identity_pool_id          = "pid"
  workload_identity_pool_provider_id = "wipp-nc"
  project = "project-id"
  display_name                       = "Name of provider"
  description                        = "AWS identity pool provider for automated test"
  disabled                           = true
  attribute_condition                = "attribute.aws_role==\"arn:aws:sts::non-compliant-aws-id:assumed-role/stack-eu-central-1-lambdaRole\""
  attribute_mapping = {
    "google.subject"        = "assertion.arn"
    "attribute.aws_account" = "assertion.account"
    "attribute.environment" = "assertion.arn.contains(\":instance-profile/Production\") ? \"prod\" : \"test\""
  }
  aws {
    account_id = "non-compliant-aws-id"
  }
}