# Non-compliant Firebase Storage bucket allowing public access
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_storage_bucket" "nc" {
  name     = "public-bucket-example"
  location = "US"
}


