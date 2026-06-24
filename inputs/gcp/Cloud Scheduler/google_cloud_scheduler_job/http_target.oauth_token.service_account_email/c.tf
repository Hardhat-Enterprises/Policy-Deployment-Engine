
resource "google_cloud_scheduler_job" "c_g0" {
  name        = "c"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  
  http_target {
    http_method = "GET"
    uri         = "https://cloudscheduler.googleapis.com/v1/projects/my-project-name/locations/australia-southeast1/jobs"

  oauth_token {
      service_account_email = "c_scheduler@pde.iam.gserviceaccount.com"
    }
  }

}


resource "google_cloud_scheduler_job" "c_g1" {
  name        = "c"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  
  http_target {
    http_method = "GET"
    uri         = "https://cloudscheduler.googleapis.com/v1/projects/my-project-name/locations/australia-southeast1/jobs"

  oauth_token {
      service_account_email = "c_scheduler@pde.iam.gserviceaccount.com"
    }
  }

}
