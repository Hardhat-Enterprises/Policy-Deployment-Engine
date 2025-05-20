# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_container_cluster" "nc" {
  name = "noncompliant-binary-auth"

  binary_authorization {
    evaluation_mode = "DISABLED"
  }
}
