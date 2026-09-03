package terraform.gcp.security.network_services.google_network_services_lb_route_extension.extension_chains_extensions_forward_headers

import data.terraform.gcp.security.network_services.google_network_services_lb_route_extension.vars

resources := [
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
]

forward_headers_invalid(values) if {
    some chain in object.get(values, "extension_chains", [])
    some extension in object.get(chain, "extensions", [])

    headers := object.get(extension, "forward_headers", null)

    headers == null
}

forward_headers_invalid(values) if {
    some chain in object.get(values, "extension_chains", [])
    some extension in object.get(chain, "extensions", [])

    headers := object.get(extension, "forward_headers", [])

    is_array(headers)
    count(headers) == 0
}

non_compliant_resources := {
    resource.name |
    some resource in resources
    forward_headers_invalid(resource.values)
}

display_resources := ["None - All passed"] if {
    count(non_compliant_resources) == 0
}

display_resources := [name | some name in non_compliant_resources] if {
    count(non_compliant_resources) > 0
}

message := [
    sprintf(
        "Total %s detected: %d ",
        [vars.variables.friendly_resource_name, count(resources)]
    ),
    "Situation 1: forward_headers is not explicitly configured with at least one header.",
    sprintf(
        "Non-Compliant Resources: %s",
        [concat(", ", display_resources)]
    ),
    "Potential Remedies: Configure forward_headers with the headers required by your application or extension."
]

details := [
    {
        "situation": "forward_headers is not explicitly configured with at least one header.",
        "remedies": [
            "Configure forward_headers with at least one explicitly selected header.",
            "Select only the headers required by your application or extension."
        ],
        "non_compliant_resources": non_compliant_resources
    }
]