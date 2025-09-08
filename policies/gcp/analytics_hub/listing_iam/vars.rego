package terraform.gcp.analytics_hub.listing_iam

# Allowed location
default allowed_locations = ["us"]

# Roles considered too permissive
default disallowed_roles = ["roles/owner", "roles/editor"]

# Disallowed members
default disallowed_members = ["allUsers", "allAuthenticatedUsers"]
