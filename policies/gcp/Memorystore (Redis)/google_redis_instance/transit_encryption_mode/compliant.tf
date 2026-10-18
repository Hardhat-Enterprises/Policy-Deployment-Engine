resource "google_redis_instance" "compliant_example_1" {
  name           = "compliant-example-1"
  tier           = "BASIC"
  memory_size_gb = 1
  region         = "australia-southeast2"

  transit_encryption_mode = "SERVER_AUTHENTICATION"
}