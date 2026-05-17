# TEMPLATE: IAM Binding multiple linked conditions
# -------------------------------------------------------------------
# BEFORE USING THIS TEMPLATE:
# 1. Confirm "role" field name in resource JSON
# 2. Confirm "members" (array) in resource JSON — _iam_binding always
#    uses plural "members"
# 3. Confirm valid roles for this resource — may be service specific
#    e.g. "roles/apigateway.viewer" not "roles/viewer"
# 4. Update the 3 fields in vars.rego
# 5. Change the package line and folder name
# ---------------------------------------------------------------------

# Make sure to change the folder name to the correct resource name
package terraform.gcp.security.<service>.<resource_type>.no_primitive_or_public_binding
import data.terraform.helpers
import data.terraform.gcp.security.<service>.<resource_type>.vars

conditions := [
    [
        {
            "situation_description": "IAM binding uses a primitive role (owner/editor/viewer)",
            "remedies": [
                "Replace roles/owner with a scoped predefined role",
                "Replace roles/editor with the minimum required predefined role",
                "Replace roles/viewer with a read-only predefined role — check valid roles for this resource e.g. roles/apigateway.viewer"
            ]
        },
        {
            "condition": "role must not be a primitive GCP role",
            "attribute_path": ["role"],  # confirm field name in resource JSON
            "values": ["roles/owner", "roles/editor", "roles/viewer"], # may be service specific,must match terraform plan e.g. "roles/apigateway.viewer" not "roles/viewer
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "IAM binding grants public access via allUsers or allAuthenticatedUsers",
            "remedies": [
                "Remove allUsers — exposes the resource to the entire internet",
                "Remove allAuthenticatedUsers — grants access to any Google account worldwide"
            ]
        },
        {
            "condition": "members must not include public identifiers",
            "attribute_path": ["members"],  # plural array — confirmed for _iam_binding
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "IAM binding grants access to all project owners, editors or viewers",
            "remedies": [
                "Replace projectOwner:projectid with a specific user or service account",
                "Replace projectEditor:projectid with a specific user or service account",
                "Replace projectViewer:projectid with a specific user or service account"
            ]
        },
        {
            "condition": "members must not include project-level broad identifiers",
            "attribute_path": ["members"],  # plural array — confirmed for _iam_binding
            "values": ["projectOwner:", "projectEditor:", "projectViewer:"],
            "policy_type": "blacklist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details