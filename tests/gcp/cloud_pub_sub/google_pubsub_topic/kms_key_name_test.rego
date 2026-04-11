package terraform.gcp.security.cloud_pub_sub.google_pubsub_topic.kms_key_name_test

import data.terraform.gcp.security.cloud_pub_sub.google_pubsub_topic.kms_key_name
import rego.v1

# Mock: compliant resource with kms_key_name set
mock_compliant := {
	"planned_values": {"root_module": {"resources": [
		{
			"type": "google_pubsub_topic",
			"values": {
				"name": "c",
				"kms_key_name": "projects/my-project/locations/global/keyRings/my-ring/cryptoKeys/my-key",
			},
		},
	]}},
}

# Mock: non-compliant resource with no kms_key_name
mock_non_compliant := {
	"planned_values": {"root_module": {"resources": [
		{
			"type": "google_pubsub_topic",
			"values": {
				"name": "nc",
				"kms_key_name": null,
			},
		},
	]}},
}

# Test 1: Compliant resource produces no violations
test_kms_key_name_compliant if {
	result := kms_key_name.result with input as mock_compliant
	every detail in result.details {
		count(detail.non_compliant_resources) == 0
	}
}

# Test 2: Non-compliant resource is flagged
test_kms_key_name_non_compliant if {
	result := kms_key_name.result with input as mock_non_compliant
	some detail in result.details
	count(detail.non_compliant_resources) > 0
}

# Test 3: Message contains the resource name when non-compliant
test_kms_key_name_message_contains_resource if {
	result := kms_key_name.result with input as mock_non_compliant
	some msg in result.message
	contains(msg, "Pub/Sub Topic")
}
