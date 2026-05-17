# TEMPLATE: IAM Member multiple linked conditions
# -----------------------------------------------------------------------
# BEFORE USING THIS TEMPLATE:
# 1. Confirm "role" field name in resource JSON
# 2. Confirm "member" (singular string) in resource JSON — _iam_member
# 3. Confirm valid roles for this resource — may be service specific
#    e.g. "roles/apigateway.viewer" not "roles/viewer"
# 4. Update the 3 fields in vars.rego
# 5. Change the package line and folder name
# -----------------------------------------------------------------------

# Make sure to change the folder name to the correct resource name
package terraform.gcp.security.<service>.<resource_type>.no_primitive_or_public_member
import data.terraform.helpers
import data.terraform.gcp.security.<service>.<resource_type>.vars

# NOTE FOR AUTHORS:
# _iam_member is non-authoritative — adds a single member to a role.
# member field is a SINGLE STRING not an array.
# Example: member = "user:jane@example.com"

conditions := [
    [
        {
            "situation_description": "IAM member uses a primitive role (owner/editor/viewer)",
            "remedies": [
                "Replace roles/owner with a scoped predefined role",
                "Replace roles/editor with the minimum required predefined role",
                "Replace roles/viewer with a read-only predefined role — check valid roles for this resource e.g. roles/apigateway.viewer"
            ]
        },
        {
            "condition": "role must not be a primitive GCP role",
            "attribute_path": ["role"],  # confirm field name in resource JSON
            "values": ["roles/owner", "roles/editor", "roles/viewer"], # may be service specific, must match terraform plan e.g. "roles/apigateway.viewer" not "roles/viewer"
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "IAM member grants public access via allUsers or allAuthenticatedUsers",
            "remedies": [
                "Remove allUsers — exposes the resource to the entire internet",
                "Remove allAuthenticatedUsers — grants access to any Google account worldwide"
            ]
        },
        {
            "condition": "member must not be a public identifier",
            "attribute_path": ["member"],  # singular string — _iam_member uses "member" 
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "IAM member grants access to all project owners, editors or viewers",
            "remedies": [
                "Replace projectOwner:projectid with a specific user or service account",
                "Replace projectEditor:projectid with a specific user or service account",
                "Replace projectViewer:projectid with a specific user or service account"
            ]
        },
        {
            "condition": "member must not be a project-level broad identifier",
            "attribute_path": ["member"],  # singular string — confirm in resource JSON
            "values": ["projectOwner:", "projectEditor:", "projectViewer:"],
            "policy_type": "blacklist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details