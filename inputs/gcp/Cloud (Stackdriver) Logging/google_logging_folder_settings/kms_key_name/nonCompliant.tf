# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
resource "google_logging_folder_settings" "non_compliant_example_1" {
  folder = "non_compliant_example_1"
}