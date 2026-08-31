package terraform.helpers.org_config

# Resolves whitelist allowlists from org-config when pde-gate merges input.org_config.
# Falls back to policy-defined values so auto_test and contributor fixtures keep working.

attribute_path_key(path) = key if {
    is_array(path)
    key := concat(".", path)
}

attribute_path_key(path) = path if {
    not is_array(path)
}

resolve_condition_values(attribute_path, default_values, policy_type) := resolved if {
    policy_type == "whitelist"
    attribute_path_key(attribute_path) == "region"
    regions := object.get(input, ["org_config", "approved_regions"], [])
    count(regions) > 0
    resolved := regions
} else := resolved if {
    policy_type == "whitelist"
    attribute_path_key(attribute_path) == "zone"
    zones := object.get(input, ["org_config", "approved_zones"], [])
    count(zones) > 0
    resolved := zones
} else := default_values
