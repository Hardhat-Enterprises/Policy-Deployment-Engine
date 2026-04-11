package terraform.gcp.security.cloud_pub_sub.google_pubsub_subscription.enable_exactly_once_delivery_test

import data.terraform.gcp.security.cloud_pub_sub.google_pubsub_subscription.enable_exactly_once_delivery
import rego.v1

# Mock: compliant resource with enable_exactly_once_delivery = true
mock_compliant := {
	"planned_values": {"root_module": {"resources": [
		{
			"type": "google_pubsub_subscription",
			"values": {
				"name": "c",
				"topic": "projects/my-project/topics/my-topic",
				"enable_exactly_once_delivery": true,
			},
		},
	]}},
}

# Mock: non-compliant resource with enable_exactly_once_delivery = false
mock_non_compliant := {
	"planned_values": {"root_module": {"resources": [
		{
			"type": "google_pubsub_subscription",
			"values": {
				"name": "nc",
				"topic": "projects/my-project/topics/my-topic",
				"enable_exactly_once_delivery": false,
			},
		},
	]}},
}

# Mock: non-compliant resource with enable_exactly_once_delivery absent (Terraform default = false)
mock_non_compliant_absent := {
	"planned_values": {"root_module": {"resources": [
		{
			"type": "google_pubsub_subscription",
			"values": {
				"name": "nc",
				"topic": "projects/my-project/topics/my-topic",
			},
		},
	]}},
}

# Test 1: Compliant resource produces no violations
test_enable_exactly_once_delivery_compliant if {
	result := enable_exactly_once_delivery.result with input as mock_compliant
	every detail in result.details {
		count(detail.non_compliant_resources) == 0
	}
}

# Test 2: Non-compliant resource is flagged
test_enable_exactly_once_delivery_non_compliant if {
	result := enable_exactly_once_delivery.result with input as mock_non_compliant
	some detail in result.details
	count(detail.non_compliant_resources) > 0
}

# Test 3: Message contains the resource name when non-compliant
test_enable_exactly_once_delivery_message_contains_resource if {
	result := enable_exactly_once_delivery.result with input as mock_non_compliant
	some msg in result.message
	contains(msg, "Pub/Sub Subscription")
}

# Test 4: Absent attribute (Terraform default false) is also flagged as non-compliant
test_enable_exactly_once_delivery_absent_is_non_compliant if {
	result := enable_exactly_once_delivery.result with input as mock_non_compliant_absent
	some detail in result.details
	count(detail.non_compliant_resources) > 0
}
