resource "google_gke_hub_membership" "nc" {
  project      = "example-project-123"
  membership_id = "nc"
  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/projects/999999/locations/europe-west1/clusters/random"
    }
  }
  authority {
    issuer = "https://container.googleapis.com/v1/projects/999999/locations/europe-west1/clusters/random"
  }
}
