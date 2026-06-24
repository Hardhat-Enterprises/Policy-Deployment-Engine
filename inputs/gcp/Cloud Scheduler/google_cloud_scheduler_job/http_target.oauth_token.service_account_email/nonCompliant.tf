resource "google_cloud_scheduler_job" "non_compliant_example_1" {
  name        = "nc"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  
  http_target {
    http_method = "GET"
    uri         = "https://cloudscheduler.googleapis.com/v1/projects/my-project-name/locations/australia-southeast1/jobs"
   
    oauth_token {
      service_account_email = ""
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
    http_method = "GET"
    uri         = "https://cloudscheduler.googleapis.com/v1/projects/my-project-name/locations/australia-southeast1/jobs"

    oauth_token {
      service_account_email = "nc_pde-compute@developer.gserviceaccount.com"
    }
    } 
}
