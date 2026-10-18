resource "google_redis_instance" "non_compliant_example_1" {
  name           = "non-compliant-example-1"
  tier           = "BASIC"
  memory_size_gb = 1
  region         = "australia-southeast2"

  customer_managed_key = ""
}