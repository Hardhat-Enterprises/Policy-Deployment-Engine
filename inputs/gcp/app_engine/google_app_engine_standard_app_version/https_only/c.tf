resource "google_app_engine_standard_app_version" "c" {
  service    = "default"
  runtime    = "python39"
  project = "my-project"
  entrypoint {
    shell = "echo Hello World"
  }
  deployment {
     zip {
            source_url = ""
    }
  }
     inbound_services = ["INBOUND_SERVICE_MAIL"]

  service_account = "projects/my-project/serviceAccounts/my-service-account@my-project.iam.gserviceaccount.com"
}
