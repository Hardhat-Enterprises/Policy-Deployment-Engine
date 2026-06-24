resource "google_cloudfunctions_function_iam_member" "nc" {
  cloud_function = "nc"
  member         = "user:janeexample.com"
  role           = "role/allUsers"




}