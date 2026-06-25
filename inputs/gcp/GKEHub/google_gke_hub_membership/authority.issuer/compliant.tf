resource "google_gke_hub_membership" "compliant_example_1" {
  project      = "example-project-123"
  membership_id = "compliant_example_1"
  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/projects/a1/locations/australia-southeast1/clusters/prod-cluster"
    }
  }
  authority {
    issuer = "https://container.googleapis.com/v1/projects/a1/locations/australia-southeast1/clusters/prod-cluster"
  }
}

