resource "google_network_services_multicast_group_consumer_activation" "non_compliant_example_1" {
  multicast_group_consumer_activation_id = "non-compliant-example-1"
  location                               = "australia-southeast1-b"

  multicast_group_range_activation = "projects/test-project/locations/australia-southeast1-b/multicastGroupRangeActivations/example-range-activation"
  multicast_consumer_association   = "projects/test-project/locations/australia-southeast1-b/multicastConsumerAssociations/example-consumer-association"

  deletion_policy = "DELETE"
}