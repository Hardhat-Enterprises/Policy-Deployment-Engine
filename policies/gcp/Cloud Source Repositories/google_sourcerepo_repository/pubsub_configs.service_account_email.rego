package terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository.pubsub_configs_service_account_email

import data.terraform.helpers
import data.terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository.vars

# policy_lint reports hard-coded-value on the address(es) below, and the finding
# stands. This attribute is a LIST, and the pattern policy types read the value as
# a single string (shared.get_target_list regex-matches it), so pointing one at an
# array makes it undefined -- which reads as "no violation", not as an error, and
# the non-compliant example would silently stop being flagged. There is no
# "element whitelist" type in policies/_helpers to check every element of a list
# against an allowed pattern; adding one is what would unblock this.
conditions := [[
	{
		"situation_description": "The service_account_email does not have a dedicated service account email provided.",
		"remedies": ["Provide a dedicated service account email for the service_account_email attribute."],
	},
	{
		"condition": "Check if the service_account_email attribute is set to a dedicated service account email.",
		"attribute_path": ["pubsub_configs", "service_account_email"],
		"values": ["service-account@project-id.iam.gserviceaccount.com"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
