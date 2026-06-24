resource "google_gke_hub_membership" "c" {
  project      = "example-project-123"
  membership_id = "c"
  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/projects/a1/locations/australia-southeast1/clusters/prod-cluster"
    }
  }
  authority {
    issuer = "https://container.googleapis.com/v1/projects/a1/locations/australia-southeast1/clusters/prod-cluster"
  }
}


