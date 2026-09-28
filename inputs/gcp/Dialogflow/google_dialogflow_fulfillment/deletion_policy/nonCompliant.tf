resource "google_dialogflow_fulfillment" "non_compliant_example_1" {
  display_name = "basic-fulfillment"
  enabled    = true
  project = "my_gcp_project"
  deletion_policy = "DELETE"
  generic_web_service {
            uri      = "https://google.com"
            username = "admin"
            password = "password"
            request_headers = { 
          name = "wrench"
            }
    }
}