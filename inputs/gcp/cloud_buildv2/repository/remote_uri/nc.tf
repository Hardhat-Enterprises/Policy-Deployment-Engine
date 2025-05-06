# Non-Compliant Terraform File (nc.tf)
# Violates policy: uses an unapproved Git host and insecure scheme (HTTP).

resource "google_cloudbuildv2_repository" "nc" {
  name              = "unsecure-repo-non-compliant"
  location          = "global"
  remote_uri        = "http://untrusted.repo.git"  # ❌ Insecure and unapproved host
  parent_connection = "projects/demo/locations/global/connections/secure-connection"
  project           = "policy-deplo"
}
#  This resource is expected to be non-compliant due to the following reasons:
# The `remote_uri` is set to "http://untrusted.repo.git", which is not an approved Git host and uses an insecure scheme (HTTP).