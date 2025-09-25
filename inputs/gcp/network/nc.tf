resource "google_service_networking_connection" "nc" {

  network                 = "projects/sixth-oxygen-468910-f1/global/networks/default" # banned
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = ["google-managed-services-range"]
}
