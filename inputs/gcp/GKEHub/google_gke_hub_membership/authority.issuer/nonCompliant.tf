resource "google_gke_hub_membership" "non_compliant_example_1" {
  project      = "example-project-123"
  membership_id = "non_compliant_example_1"
  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/projects/a1/locations/australia-southeast1/clusters/prod-cluster"
    }
  }
  authority {
    issuer = "https://container.googleapis.com/v1/projects/999999/locations/europe-west1/clusters/random"
  }
}
