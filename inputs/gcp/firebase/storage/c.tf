# Compliant Firebase Storage bucket restricted to project members
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_storage_bucket" "c" {
  name     = "restricted-bucket-example"
  location = "US"
}
