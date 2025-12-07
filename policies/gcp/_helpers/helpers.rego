package terraform.gcp.helpers

# Shim to redirect to common helpers at policies/_helpers/
# This allows existing GCP policies to continue using terraform.gcp.helpers
# while the actual implementation has moved to terraform.helpers

import data.terraform.helpers

# Re-export the function that policies actually use
# In Rego, we need to wrap the function call, not assign it
get_multi_summary(situations, variables) = helpers.get_multi_summary(situations, variables) 
