resource "google_cloudfunctions_function_iam_member" "c" {
    cloud_function = "google_cloudfunctions_function.function.name"
    member = "user:jane@example.com"
    role = "role/allAuthenticatedUsers"
    region = "australia-southeast2"
    
    
    
}

