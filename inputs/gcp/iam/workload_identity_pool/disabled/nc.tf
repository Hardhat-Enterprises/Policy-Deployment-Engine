# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_iam_workload_identity_pool" "nc" {
  workload_identity_pool_id = "wip-nc"
  display_name              = "Name of pool"
  description               = "Identity pool for automated test"
  disabled                  = true
  project = "other"
}