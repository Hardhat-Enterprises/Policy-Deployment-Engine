resource "google_app_engine_standard_app_version" "non_compliant_example_1" {
  project    = "appeng-flex"
  version_id = "v1"
  service    = "unauthorized-app-name"
  runtime    = "nodejs20"

  entrypoint {
    shell = "node ./app.js"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/hardhat-standard-static-content/hello-world.zip"
    }
  }

  service_account = "my-account-c@appeng-flex.iam.gserviceaccount.com"
}
