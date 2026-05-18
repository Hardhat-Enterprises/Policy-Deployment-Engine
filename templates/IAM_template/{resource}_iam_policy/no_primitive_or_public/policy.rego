# TEMPLATE: IAM Policy multiple linked conditions
# -----------------------------------------------------------------------
# BEFORE USING THIS TEMPLATE:
# 1. Confirm "policy_data" field name in resource JSON
# 2. Confirm valid roles for this resource — may be service specific
#    e.g. "roles/apigateway.viewer" not "roles/viewer"
# 3. Update the 3 fields in vars.rego
# 4. Change the package line and folder name
# -----------------------------------------------------------------------

# Make sure to change the folder name to the correct resource name
package terraform.gcp.security.<service>.<resource_type>.no_primitive_or_public
import data.terraform.helpers
import data.terraform.gcp.security.<service>.<resource_type>.vars

# NOTE FOR AUTHORS:
# _iam_policy wraps all bindings inside a single policy_data JSON string.
# Structure inside policy_data:
#   { "bindings": [{ "role": "roles/apigateway.viewer",
#                    "members": ["user:jane@example.com"] }] }
# All three conditions check policy_data as the attribute path.
# values are full JSON string patterns — they must match exactly how
# the binding appears inside policy_data

conditions := [
    [
        {
            "situation_description": "IAM policy contains a primitive role (owner/editor/viewer)",
            "remedies": [
                "Replace roles/owner with a scoped predefined role",
                "Replace roles/editor with the minimum required predefined role",
                "Replace roles/viewer with a read-only predefined role "
            ]
        },
        {
            "condition": "policy_data must not contain a primitive GCP role",
            "attribute_path": ["policy_data"],
            "values": [
                "{\"bindings\":[{\"members\":[\"<member>\"],\"role\":\"roles/owner\"}]}", # check valid roles for this resource e.g. roles/apigateway.viewer
                "{\"bindings\":[{\"members\":[\"<member>\"],\"role\":\"roles/editor\"}]}",
                "{\"bindings\":[{\"members\":[\"<member>\"],\"role\":\"roles/viewer\"}]}"
            ],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "IAM policy grants public access via allUsers or allAuthenticatedUsers",
            "remedies": [
                "Remove allUsers — exposes the resource to the entire internet",
                "Remove allAuthenticatedUsers — grants access to any Google account worldwide"
            ]
        },
        {
            "condition": "policy_data must not contain public identifiers",
            "attribute_path": ["policy_data"],
            "values": [
                "{\"bindings\":[{\"members\":[\"allUsers\"],\"role\":\"roles/<replace_with_valid_role>\"}]}", #role must match terraform plan
                "{\"bindings\":[{\"members\":[\"allAuthenticatedUsers\"],\"role\":\"roles/<replace_with_valid_role>\"}]}"
            ],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "IAM policy grants access to all project owners, editors or viewers",
            "remedies": [
                "Replace projectOwner:projectid with a specific user or service account",
                "Replace projectEditor:projectid with a specific user or service account",
                "Replace projectViewer:projectid with a specific user or service account"
            ]
        },
        {
            "condition": "policy_data must not contain project-level broad identifiers",
            "attribute_path": ["policy_data"],
            "values": [
                "{\"bindings\":[{\"members\":[\"projectOwner:<project_id>\"],\"role\":\"roles/<replace_with_valid_role>\"}]}", # both the project ID and the role must match what's in the terraform plan
                "{\"bindings\":[{\"members\":[\"projectEditor:<project_id>\"],\"role\":\"roles/<replace_with_valid_role>\"}]}",
                "{\"bindings\":[{\"members\":[\"projectViewer:<project_id>\"],\"role\":\"roles/<replace_with_valid_role>\"}]}"
            ],
            "policy_type": "blacklist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details