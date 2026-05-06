locals {
  allowed_members_policy_data = {
    name          = "allowed_members"
    description   = "Ensures only approved IAM members are granted access to Cloud Endpoints services."
    recommendation = "Remove unapproved IAM members or add them to the approved allowlist if justified."
    severity      = "high"
    scope         = "resource"
    provider      = "gcp"
    service       = "google_endpoints"
    resource_type = "google_endpoints_service_iam_member"
    policy_type   = "preventive"
  }
}