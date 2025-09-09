package terraform.gcp.security.firebase_app_hosting.default_domain.domain_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_app_hosting.default_domain.vars

conditions := [
    [
        {
            "situation_description": "Default domain ID does not follow the required Google Cloud format pattern",
            "remedies": [
                "Use the correct format: {{backend}}--{{project_id}}.{{location}}.hosted.app",
                "Ensure domain ID matches the backend, project, and location values",
                "Do not use custom domain formats for default domains"
            ]
        },
        {
            "condition": "Domain ID should follow the required Google Cloud default domain pattern",
            "attribute_path": ["domain_id"],
            "values": ["*--*.*.hosted.app"],
            "policy_type": "pattern whitelist",
            "custom_eval": "check_domain_id"
        }
    ]
]

# Custom evaluation rule to validate domain_id format and consistency
check_domain_id(resource, attribute_path, allowed_values) = valid if {
    domain_id := get_attribute(resource, attribute_path)
    # Check if domain_id matches the pattern
    regex.match(`^[^-]+--[^.]+[.][^.]+[.]hosted[.]app$`, domain_id)
    # Split domain_id into components: backend--project.location.hosted.app
    parts := split(domain_id, "--")
    count(parts) == 2
    backend := parts[0]
    rest := split(parts[1], ".")
    count(rest) == 3
    project := rest[0]
    location := rest[1]
    tld := rest[2]
    tld == "hosted.app"
    # Verify components match resource attributes
    backend == get_attribute(resource, ["backend"])
    project == get_attribute(resource, ["project"])
    location == get_attribute(resource, ["location"])
    valid := true
}

# Helper rule to safely get attribute value
get_attribute(resource, path) = value if {
    value := object.get(resource, path, "")
}

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details