resource "google_compute_interconnect_attachment" "non_compliant_example_1" {
  name       = "non-compliant-example-1"
  project    = "smooth-verve-467716-v1"
  region     = "australia-southeast1"
  encryption = "NONE"
}
