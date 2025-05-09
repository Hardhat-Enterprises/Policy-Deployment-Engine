resource "google_dns_managed_zone" "nc" {
    name = "private_zone_gke"
    project = "dns_managed_zone"
    dns_name = "pde.example.com"
    visibility = "private"

    private_visibility_config {
      gke_clusters{
        gke_cluster_name = ""
      }
    }
}