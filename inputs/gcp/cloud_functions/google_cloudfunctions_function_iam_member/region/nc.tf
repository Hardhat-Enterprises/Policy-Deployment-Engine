resource "google_cloudfunctions_function_iam_member" "nc" {
    cloud_function = "google_cloudfunctions_function.function.name"
    member = "user:janeexample.com"
    role = "role/allUsers"
    region = "us-east1"
    
    
    
}