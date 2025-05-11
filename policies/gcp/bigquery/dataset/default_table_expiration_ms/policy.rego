package terraform.gcp.security.bigquery.dataset.default_table_expiration_ms
import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery.dataset.vars

attribute_path := "default_table_expiration_ms"
min_value := 86400000  # 24 hours in milliseconds (organizational policy)

# Custom non-compliant resource getter for numeric comparison
get_nc_resources(resource_type) = resources {
    resources := [
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == resource_type
        value := object.get(resource.values, attribute_path, null)
        value < min_value
    ]
}

# Custom violation messages that use dataset_id instead of name
get_violations(resource_type, friendly_resource_name) = violations {
    violations := [
        msg |
        nc_resources := get_nc_resources(resource_type)
        id := object.get(nc_resources[_].values, "dataset_id", "unknown")
        value := object.get(nc_resources[_].values, attribute_path, null)
        msg := sprintf(
            "%s '%s' has '%s' set to %d ms which is less than the organization's required minimum of %d ms (24 hours)",
            [friendly_resource_name, id, replace(attribute_path, "_", " "), value, min_value]
        )
    ]
}

# Custom summary using our custom violation getter
summary = {
    "message": array.concat(
        [
            sprintf("Total %s detected: %d", [vars.friendly_resource_name, count(helpers.get_all_resources(vars.resource_type))]),
            sprintf("Non-compliant %s: %d/%d", [vars.friendly_resource_name, count(get_nc_resources(vars.resource_type)), count(helpers.get_all_resources(vars.resource_type))])
        ],
        get_violations(vars.resource_type, vars.friendly_resource_name)
    )
}