# Compliant Terraform File (c.tf)
# This resource is compliant with the remote_uri policy and uses a secure, approved GitHub HTTPS link.

resource "google_cloudbuildv2_repository" "c" {
  name              = "secure-repo-compliant"
  location          = "global"
  remote_uri        = "https://github.com/secure/repo.git"  # ✅ Approved and secure
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"
}
