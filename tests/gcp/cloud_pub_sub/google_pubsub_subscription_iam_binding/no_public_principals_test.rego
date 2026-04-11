package terraform.gcp.security.cloud_pub_sub.google_pubsub_subscription_iam_binding.no_public_principals_test

import data.terraform.gcp.security.cloud_pub_sub.google_pubsub_subscription_iam_binding.no_public_principals
import rego.v1

# Mock: compliant resource using a specific service account
mock_compliant := {
	"planned_values": {"root_module": {"resources": [
		{
			"type": "google_pubsub_subscription_iam_binding",
			"values": {
				"subscription": "c",
				"role": "roles/pubsub.subscriber",
				"members": ["serviceAccount:my-sa@my-project.iam.gserviceaccount.com"],
			},
		},
	]}},
}

# Mock: non-compliant resource granting access to allAuthenticatedUsers
mock_non_compliant := {
	"planned_values": {"root_module": {"resources": [
		{
			"type": "google_pubsub_subscription_iam_binding",
			"values": {
				"subscription": "nc",
				"role": "roles/pubsub.subscriber",
				"members": ["allAuthenticatedUsers"],
			},
		},
	]}},
}

# Test 1: Compliant resource produces no violations
test_no_public_principals_compliant if {
	result := no_public_principals.result with input as mock_compliant
	every detail in result.details {
		count(detail.non_compliant_resources) == 0
	}
}

# Test 2: Non-compliant resource is flagged
test_no_public_principals_non_compliant if {
	result := no_public_principals.result with input as mock_non_compliant
	some detail in result.details
	count(detail.non_compliant_resources) > 0
}

# Test 3: Message contains the resource name when non-compliant
test_no_public_principals_message_contains_resource if {
	result := no_public_principals.result with input as mock_non_compliant
	some msg in result.message
	contains(msg, "Pub/Sub Subscription IAM Binding")
}
