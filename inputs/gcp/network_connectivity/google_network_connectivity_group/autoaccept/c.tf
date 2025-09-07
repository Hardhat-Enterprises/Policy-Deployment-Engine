# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_network_connectivity_group" "c" {
  hub         = google_network_connectivity_hub.basic_hub.id
  name        = "default"
  labels = {
    label-one = "value-one"
  }
  description = "A sample hub group"
  auto_accept {
      auto_accept_projects = [
        "foo", 
        "bar", 
      ]
  }
}
