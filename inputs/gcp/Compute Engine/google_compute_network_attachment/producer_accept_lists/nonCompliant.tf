# Test that an unrestricted or overly broad project list is treated as non-compliant.

resource "google_compute_network_attachment" "non_compliant_example_1" {
  producer_accept_lists = [
    "unapproved-project-123",
    "unapproved-project-456"
  ]
}