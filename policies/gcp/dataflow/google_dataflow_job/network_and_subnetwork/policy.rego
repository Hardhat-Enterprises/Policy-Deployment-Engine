package terraform.gcp.security.dataflow.google_dataflow_job.network_and_subnetwork

import data.terraform.gcp._helpers.helpers
import data.terraform.gcp.security.dataflow.google_dataflow_job.vars

resource_type := vars.variables.resource_type
friendly_resource_name := vars.variables.friendly_resource_name
resource_value_name := vars.variables.resource_value_name
allowed_network := vars.variables.allowed_network
allowed_subnetwork := vars.variables.allowed_subnetwork

default message = ""
default details = {}



# Deny if network is missing
deny[message] if {
    some i
    resource := input.resource_changes[i]
    resource.type == resource_type
    not resource.change.after.network
    message := sprintf("Dataflow job '%s' is non-compliant: missing network.", [resource.address])
}

# Deny if network is not allowed
deny[message] if {
    some i
    resource := input.resource_changes[i]
    resource.type == resource_type
    resource.change.after.network != allowed_network
    message := sprintf("Dataflow job '%s' is non-compliant: network '%s' is not allowed.", [resource.address, resource.change.after.network])
}

# Deny if subnetwork is missing
deny[message] if {
    some i
    resource := input.resource_changes[i]
    resource.type == resource_type
    not resource.change.after.subnetwork
    message := sprintf("Dataflow job '%s' is non-compliant: missing subnetwork.", [resource.address])
}

# Deny if subnetwork is not allowed
deny[message] if {
    some i
    resource := input.resource_changes[i]
    resource.type == resource_type
    resource.change.after.subnetwork != allowed_subnetwork
    message := sprintf("Dataflow job '%s' is non-compliant: subnetwork '%s' is not allowed.", [resource.address, resource.change.after.subnetwork])
}
