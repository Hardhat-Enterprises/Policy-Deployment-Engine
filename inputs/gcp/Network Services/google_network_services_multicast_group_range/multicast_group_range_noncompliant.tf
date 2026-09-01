# google_network_services_multicast_group_range — NON-COMPLIANT example
# Each marked line violates a security_impact = true rule from
# multicast_group_range_security_assessment.json

resource "google_network_services_multicast_group_range" "example" {
  multicast_group_range_id = "example-range"
  location                 = "global"
  project                  = var.project_id
  multicast_domain         = google_network_services_multicast_domain.example.id
  reserved_internal_range  = google_network_connectivity_internal_range.mcast_range.id

  deletion_policy = "DELETE"            # VIOLATION deletion_policy — live range can be destroyed with no guard

  # require_explicit_accept omitted     # VIOLATION require_explicit_accept — defaults to false, open to any project with domain access
  # consumer_accept_list omitted        # VIOLATION consumer_accept_list — no allow list even though access is open

  log_config {
    enabled = false                     # VIOLATION log_config.enabled — no record of who joined or left the range
  }
}
