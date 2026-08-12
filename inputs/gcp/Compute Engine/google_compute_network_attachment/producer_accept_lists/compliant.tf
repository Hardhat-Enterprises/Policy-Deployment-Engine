# Test that only an approved project is allowed to connect.

resource "google_compute_network_attachment" "compliant_example_1" {
  producer_accept_lists = [
    "approved-project-123"
  ]
}