resource "google_app_engine_standard_app_version" "nc" {
  service    = "default"
  runtime    = "python39"
  project = "my-project"
  deployment {
    zip {
            source_url = ""

    }
  }
  entrypoint {
    shell = "echo Hello World"
  }
  env_variables = {
    SECRET_SOURCE = "plaintext-password"
  }
  service_account = "projects/my-project/serviceAccounts/default@appspot.gserviceaccount.com"
}
