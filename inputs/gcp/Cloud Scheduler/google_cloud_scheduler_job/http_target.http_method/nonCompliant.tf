resource "google_cloud_scheduler_job" "non_compliant_example_1" {
  name        = "nc"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

   http_target {
    http_method = "GET"
    uri         = "https://example.com/ping"
    body        = base64encode("{\"foo\":\"bar\"}")
    headers = {
      "Content-Type" = "application/json"
    }
   }
}

resource "google_cloud_scheduler_job" "non_compliant_example_2" {
  name        = "nc"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  
  http_target {
    http_method = "DELETE"
    uri         = "https://pubsub.googleapis.com/v1/projects/my-project-name/locations/australia-southeast1/jobs"
  }

}
