# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant
resource "google_iam_workload_identity_pool" "c" {
  workload_identity_pool_id = "wip-c"
  display_name              = "Name of pool"
  description               = "Identity pool for automated test"
  disabled                  = false
  project = "pid"
}