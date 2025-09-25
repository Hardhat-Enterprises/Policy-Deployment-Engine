resource "google_service_networking_connection" "c" {
  
  network                 = "projects/sixth-oxygen-468910-f1/global/networks/prod-vpc"
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = ["google-managed-services-range"]
}
