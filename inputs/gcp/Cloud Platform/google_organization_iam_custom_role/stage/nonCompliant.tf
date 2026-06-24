resource "google_organization_iam_custom_role" "non_compliant_example_1" {
  role_id     = "badCustomRole"
  org_id      = "123456789"
  title       = "Over-Privileged Role"
  description = "Grants too much power"
  permissions = ["iam.roles.delete", "resourcemanager.*"]  # ❌ risky
  stage       = "ALPHA"                                   # ❌ unstable
}
