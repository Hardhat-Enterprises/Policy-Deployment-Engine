# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_cloud_run_v2_job" "c" {
name = "cloud_run_job-c"
location = "AU"
labels = {
    cost_center = "cloud platform"
    managed_by  = "terraform"
    compliance  = "true"
    owner_team  = "secops"
}
  template {
    template {
      containers {
        image = "gcr.io/example/image"
      }
    }
  }
}
