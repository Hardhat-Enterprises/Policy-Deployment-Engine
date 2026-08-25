resource "google_compute_disk" "compliant_example_1" {
  name = "compliant-example-1"
  zone = "australia-southeast1-a"
  type = "pd-ssd"

  params {
    resource_manager_tags = {
      "tagKeys/data-classification" = "tagValues/confidential"
    }
  }
}