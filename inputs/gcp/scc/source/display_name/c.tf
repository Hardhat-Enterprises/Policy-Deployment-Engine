# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_scc_source" "c" {
  display_name = "My Source"
  organization = "123456789"
  description  = "My custom Cloud Security Command Center Finding Source"
}