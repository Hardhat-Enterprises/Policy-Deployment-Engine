resource "google_organization_iam_custom_role" "non_compliant_example_1" {
  role_id     = "myCustomRole"
  org_id      = "123456789"
  title       = "Read Only Role"
  description = "Minimal safe permissions"
  permissions = ["iam.roles.list"]   # ✅ allowed
  stage       = "ALPHA"                                   # ❌ unstable
}
