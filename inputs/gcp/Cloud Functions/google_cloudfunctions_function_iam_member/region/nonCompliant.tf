resource "google_cloudfunctions_function_iam_member" "non_compliant_example_1" {
  cloud_function = "non_compliant_example_1"
  member         = "user:janeexample.com"
  role           = "role/allUsers"
  region         = "us-east1"

}
