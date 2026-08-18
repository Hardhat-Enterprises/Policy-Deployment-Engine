resource "google_app_engine_standard_app_version" "compliant_example_1" {
  version_id = "v1"
  project    = "appeng-flex"
  service    = "default"
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
