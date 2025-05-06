# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_cloudbuildv2_connection_iam_member" "nc" {
  name     = "insecure-connection-member"  # ❌ Name should be "secure-connection-member"
  project    = "policy-deplo"                  # ❌ Project name should be "policy-deplo"
  location   = "us-central1"                    # ❌ Unexpected region
  //connection = ""                               # ❌ Missing connection name
  role       = "roles/owner"                    # ❌ Elevated privilege
  member     = "user:external@gmail.com"        # ❌ External user not allowed
}

