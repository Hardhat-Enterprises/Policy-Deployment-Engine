resource "google_network_services_multicast_group_range" "non_compliant_example_1" {
  multicast_group_range_id = "example-range"
  location                 = "global"
  multicast_domain         = google_network_services_multicast_domain.example.id
  reserved_internal_range  = google_network_connectivity_internal_range.mcast_range.id

  deletion_policy = "PREVENT"

  require_explicit_accept = false

  consumer_accept_list = [
    "projects/example-consumer-a",
    "projects/example-consumer-b"
  ]

  log_config {
    enabled = true
  }
}