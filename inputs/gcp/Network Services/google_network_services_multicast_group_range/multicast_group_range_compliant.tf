# google_network_services_multicast_group_range — COMPLIANT example
# Exercises every argument assessed as security_impact = true in
# multicast_group_range_security_assessment.json:
#   deletion_policy, location, require_explicit_accept,
#   consumer_accept_list, log_config.enabled

resource "google_network_services_multicast_domain" "example" {
  multicast_domain_id = "example-domain"
  location             = "global"
  project              = var.project_id
}

resource "google_network_connectivity_internal_range" "mcast_range" {
  name          = "mcast-internal-range"
  project       = var.project_id
  peering       = "FOR_SELF"
  ip_cidr_range = "224.0.1.0/24"
  network       = "projects/${var.project_id}/global/networks/${var.network_name}"
}

resource "google_network_services_multicast_group_range" "example" {
  multicast_group_range_id = "example-range"
  location                 = "global"   # COMPLIANT — only accepted value for this resource; not a policed argument
  project                  = var.project_id
  multicast_domain         = google_network_services_multicast_domain.example.id
  reserved_internal_range  = google_network_connectivity_internal_range.mcast_range.id

  deletion_policy = "PREVENT"           # COMPLIANT — blocks accidental destroy of a live consumer boundary

  require_explicit_accept = true        # COMPLIANT — deny by default
  consumer_accept_list = [              # COMPLIANT — populated, no catch-all
    var.approved_consumer_project_a,
    var.approved_consumer_project_b,
  ]

  log_config {
    enabled = true                      # COMPLIANT — membership join/leave events are recorded
  }
}
