package terraform.gcp.security.cloud_buildv2.repository.annotations

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.repository.vars

scenarios_list := [
  # Scenario 1: Check if the annotations block is defined
	[
		{
			"situation_description": "Annotations must be defined for the repository",
			"remedies": ["Ensure 'annotations' block is present in your Terraform configuration."],
		},
		{
			"condition": "Missing or undefined annotations",
			"attribute_path": ["annotations"],
			"values": [""],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Annotations must include 'owner' to specify the owner of the repository",
			"remedies": ["Add an 'owner' key to annotations with a valid value"],
		},
		{
			"condition": "Missing or invalid 'owner' in annotations",
			"attribute_path": ["annotations", "owner"],
			"values": [""],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Annotations must include 'team' to specify the team responsible for the repository",
			"remedies": ["Add a 'team' key to annotations with a valid value"],
		},
		{
			"condition": "Missing or invalid 'team' in annotations",
			"attribute_path": ["annotations", "team"],
			"values": [""],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Annotations must include 'contact' to provide a contact point",
			"remedies": ["Add a 'contact' key to annotations with a valid value"],
		},
		{
			"condition": "Missing or invalid 'contact' in annotations",
			"attribute_path": ["annotations", "contact"],
			"values": [""],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Annotations must include 'created_by' to indicate who created the repository",
			"remedies": ["Add a 'created_by' key to annotations with a valid value"],
		},
		{
			"condition": "Missing or invalid 'created_by' in annotations",
			"attribute_path": ["annotations", "created_by"],
			"values": [""],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Annotations must include 'created_at' to indicate when the repository was created",
			"remedies": ["Add a 'created_at' key to annotations with a valid value"],
		},
		{
			"condition": "Missing or invalid 'created_at' in annotations",
			"attribute_path": ["annotations", "created_at"],
			"values": [""],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Annotations must include 'updated_at' to indicate when the repository was last updated",
			"remedies": ["Add an 'updated_at' key to annotations with a valid value"],
		},
		{
			"condition": "Missing or invalid 'updated_at' in annotations",
			"attribute_path": ["annotations", "updated_at"],
			"values": [""],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Annotations must include 'version' to indicate the version of the repository",
			"remedies": ["Add a 'version' key to annotations with a valid value"],
		},
		{
			"condition": "Missing or invalid 'version' in annotations",
			"attribute_path": ["annotations", "version"],
			"values": [""],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Annotations must include 'repository_type' to specify the type of repository",
			"remedies": ["Add a 'repository_type' key to annotations with a valid value"],
		},
		{
			"condition": "Missing or invalid 'repository_type' in annotations",
			"attribute_path": ["annotations", "repository_type"],
			"values": [""],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Annotations must include 'repository_url' to provide the URL of the repository",
			"remedies": ["Add a 'repository_url' key to annotations with a valid value"],
		},
		{
			"condition": "Missing or invalid 'repository_url' in annotations",
			"attribute_path": ["annotations", "repository_url"],
			"values": [""],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Annotations must include 'repository_name' to specify the name of the repository",
			"remedies": ["Add a 'repository_name' key to annotations with a valid value"],
		},
		{
			"condition": "Missing or invalid 'repository_name' in annotations",
			"attribute_path": ["annotations", "repository_name"],
			"values": [""],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Annotations must include 'description' to provide context",
			"remedies": ["Add a 'description' key to annotations with a valid value"],
		},
		{
			"condition": "Missing or invalid 'description' in annotations",
			"attribute_path": ["annotations", "description"],
			"values": [""],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Annotations must include 'environment' to indicate usage context",
			"remedies": ["Add an 'environment' key to annotations with a valid value like 'production' or 'dev'"],
		},
		{
			"condition": "Missing or invalid 'environment' in annotations",
			"attribute_path": ["annotations", "environment"],
			"values": ["production", "staging", "dev"],
			"policy_type": "whitelist",
		},
	],
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message

details := summary.details
