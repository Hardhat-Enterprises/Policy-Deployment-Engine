# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_container_cluster" "c" {
  name = "compliant-workload-identity"

  workload_identity_config {
    workload_pool = "my-project.svc.id.goog"
  }
}
