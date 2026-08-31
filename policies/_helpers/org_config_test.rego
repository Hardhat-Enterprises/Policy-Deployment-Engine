package terraform.helpers.org_config_test

import data.terraform.helpers.org_config

test_resolve_region_from_org_config if {
    resolved := org_config.resolve_condition_values(["region"], ["hardcoded"], "whitelist") with input as {
        "org_config": {"approved_regions": ["europe-west1"]}
    }
    resolved == ["europe-west1"]
}

test_resolve_region_fallback_without_org_config if {
    resolved := org_config.resolve_condition_values(["region"], ["hardcoded"], "whitelist") with input as {}
    resolved == ["hardcoded"]
}

test_blacklist_not_overridden if {
    resolved := org_config.resolve_condition_values(["region"], ["bad"], "blacklist") with input as {
        "org_config": {"approved_regions": ["europe-west1"]}
    }
    resolved == ["bad"]
}
