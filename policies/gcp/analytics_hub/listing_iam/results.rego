package terraform.gcp.security.analytics_hub.listing_iam

# Extract only violation messages
message := [msg | v := deny[_]; msg := v.msg]

# Provide structured details
details := [v | v := deny[_]]