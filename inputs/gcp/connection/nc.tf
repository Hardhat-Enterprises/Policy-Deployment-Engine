resource "google_service_networking_connection" "nc" {
  network                 = "projects/sixth-oxygen-468910-f1/global/networks/default"
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = ["192.168.0.0/16"] # banned range
}
