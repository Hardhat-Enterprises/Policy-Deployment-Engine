resource "google_compute_image" "compliant_example_1" {
  name = "compliant-example-1"

  source_disk = "projects/pde-demo/zones/us-central1-a/disks/example-disk"

  params {
    resource_manager_tags = {
      "tagKeys/123456789012" = "tagValues/987654321098"
    }
  }
}