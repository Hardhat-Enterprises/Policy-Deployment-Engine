resource "google_network_connectivity_spoke" "non_compliant_example_1" {
  name     = "non-compliant-spoke"
  location = "us-central1"

  hub = "projects/approved-network-project/locations/global/hubs/approved-hub"

  linked_interconnect_attachments {
    uris = [
      "projects/unapproved-project/regions/us-central1/interconnectAttachments/unapproved-attachment"
    ]

    site_to_site_data_transfer = false
  }
}