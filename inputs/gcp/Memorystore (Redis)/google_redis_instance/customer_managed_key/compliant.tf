resource "google_redis_instance" "compliant_example_1" {
  name           = "compliant-example-1"
  tier           = "BASIC"
  memory_size_gb = 1
  region         = "australia-southeast2"

  customer_managed_key = "projects/deakin-lab-123/locations/australia-southeast2/keyRings/redis-keyring/cryptoKeys/redis-key"
}