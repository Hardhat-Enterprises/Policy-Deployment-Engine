resource "google_cloud_scheduler_job" "nc" {
  name        = "nc"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  
  http_target {
    http_method = "GET"
    uri         = "https://cloudscheduler.googleapis.com/v1/projects/my-project-name/locations/australia-southeast1/jobs"
    }
  
}