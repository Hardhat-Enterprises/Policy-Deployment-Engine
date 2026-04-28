resource "google_cloud_scheduler_job" "nc_1" {
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

resource "google_cloud_scheduler_job" "nc_2" {
  name        = "nc"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  
  http_target {
    http_method = "GET"
    uri         = "https://cloudscheduler.googleapis.com/v1/projects/my-project-name/locations/australia-southeast1/jobs"

    oauth_token {
      service_account_email = "nc.pde@appspot.gserviceaccount.com"
    }
    }
  
}

resource "google_cloud_scheduler_job" "nc_3" {
  name        = "nc"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  
  http_target {
    http_method = "GET"
    uri         = "https://cloudscheduler.googleapis.com/v1/projects/my-project-name/locations/australia-southeast1/jobs"

    oidc_token {
      service_account_email = "nc_pde-compute@developer.gserviceaccount.com"
    }
    }
  
}

resource "google_cloud_scheduler_job" "nc_4" {
  name        = "nc"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  
  http_target {
    http_method = "GET"
    uri         = "https://cloudscheduler.googleapis.com/v1/projects/my-project-name/locations/australia-southeast1/jobs"

    oidc_token {
      service_account_email = "nc.pde@appspot.gserviceaccount.com"
    }
    }
  
}

