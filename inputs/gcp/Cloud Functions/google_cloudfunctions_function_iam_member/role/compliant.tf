resource "google_cloudfunctions_function_iam_member" "compliant_example_1" {
  cloud_function = "compliant_example_1"
  member         = "user:jane@example.com"
  role           = "role/allAuthenticatedUsers"

}
