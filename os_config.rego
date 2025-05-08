package gcp.os_config

import input.planned_values as tfplan

deny contains msg if {
	resource := tfplan.root_module.resources[_]
	resource.type == "google_os_config_patch_deployment"
	schedule := resource.values.recurring_schedule
	time := schedule[0].time_of_day[0]
	time.hours >= 8
	time.hours <= 17
	msg := sprintf("Patch deployments cannot be scheduled between 8AM-5PM (scheduled for %d:%d)", [time.hours, time.minutes])
}

deny contains msg if {
	resource := tfplan.root_module.resources[_]
	resource.type == "google_os_config_patch_deployment"
	patch_config := resource.values.patch_config
	windows_update := patch_config[0].windows_update
	not contains_security(windows_update[0].classifications)
	msg := sprintf("Patch deployment %s must include SECURITY updates for Windows", [resource.values.patch_deployment_id])
}

contains_security(classifications) if {
	classifications[_] == "SECURITY"
}

deny contains msg if {
    resource := tfplan.root_module.resources[_]
    resource.type == "google_os_config_patch_deployment"
    patch_config := resource.values.patch_config
    reboot_config := patch_config[0].reboot_config
    not valid_reboot_config(reboot_config)
    msg := sprintf("Patch deployment %s has invalid reboot_config %s. Must be one of: DEFAULT, ALWAYS, NEVER", [resource.values.patch_deployment_id, reboot_config])
}

valid_reboot_config(config) if {
  config == "DEFAULT"
}

valid_reboot_config(config) if {
  config == "ALWAYS"
}

valid_reboot_config(config) if {
  config == "NEVER"
}

deny contains msg if {
    resource := tfplan.root_module.resources[_]
    resource.type == "google_os_config_guest_policies"
    recipes := resource.values.recipes
    not has_guest_policy_recipe(recipes)
    msg := sprintf("Guest policy '%s' must include script.sh", [resource.values.guest_policy_id])
}

has_guest_policy_recipe(recipes) if {
    some i
    recipes[i].name == "guest_policy_recipe"
}

# Zone Validation Policy
# Ensures patch deployments and guest policies are only applied to approved zones
deny contains msg if {
    resource := tfplan.root_module.resources[_]
    resource.type == "google_os_config_patch_deployment"
    instance_filter := resource.values.instance_filter
    zones := instance_filter[0].zones
    not all_zones_approved(zones)
    msg := sprintf("Patch deployment %s contains unapproved zones. Allowed zones are: australia-southeast1-a, australia-southeast1-b, australia-southeast2-a, australia-southeast2-b", [resource.values.patch_deployment_id])
}

deny contains msg if {
    resource := tfplan.root_module.resources[_]
    resource.type == "google_os_config_guest_policies"
    assignment := resource.values.assignment
    zones := assignment[0].zones
    not all_zones_approved(zones)
    msg := sprintf("Guest policy %s contains unapproved zones. Allowed zones are: australia-southeast1-a, australia-southeast1-b, australia-southeast2-a, australia-southeast2-b", [resource.values.guest_policy_id])
}

all_zones_approved(zones) if {
    approved_zones := {"australia-southeast1-a", "australia-southeast1-b", "australia-southeast2-a", "australia-southeast2-b"}
    count([z | z := zones[_]; not approved_zones[z]]) == 0
}

# Patch Duration Limit Policy
# Enforces maximum duration for patch deployments to prevent long-running operations
deny contains msg if {
    resource := tfplan.root_module.resources[_]
    resource.type == "google_os_config_patch_deployment"
    duration := resource.values.duration
    duration_seconds := to_seconds(duration)
    duration_seconds > 7200 # 2 hours max
    msg := sprintf("Patch deployment %s exceeds maximum allowed duration of 2 hours (7200s)", [resource.values.patch_deployment_id])
}

to_seconds(duration) = sec {
    endswith(duration, "s")
    sec := to_number(trim_suffix(duration, "s"))
} else = sec {
    endswith(duration, "m")
    sec := to_number(trim_suffix(duration, "m")) * 60
} else = sec {
    endswith(duration, "h")
    sec := to_number(trim_suffix(duration, "h")) * 3600
}

# Required Package Policy
# Ensures specific critical packages are always included in guest policies
deny contains msg if {
    resource := tfplan.root_module.resources[_]
    resource.type == "google_os_config_guest_policies"
    packages := resource.values.packages
    not has_required_packages(packages)
    msg := sprintf("Guest policy %s must include required packages: python3, openssh-server", [resource.values.guest_policy_id])
}

has_required_packages(packages) if {
    required_packages := {"python3"}
    package_names := {name | name := packages[_].name}
    required_packages_missing := required_packages - package_names
    count(required_packages_missing) == 0
}

# Rollout Mode Validation
# Ensures patch deployments use an approved rollout strategy
deny contains msg if {
    resource := tfplan.root_module.resources[_]
    resource.type == "google_os_config_patch_deployment"
    rollout := resource.values.rollout
    mode := rollout[0].mode
    not valid_rollout_mode(mode)
    msg := sprintf("Patch deployment %s has invalid rollout mode %s. Must be one of: ZONE_BY_ZONE, CONCURRENT_ZONES", [resource.values.patch_deployment_id, mode])
}

valid_rollout_mode(mode) if {
    mode == "ZONE_BY_ZONE"
}

valid_rollout_mode(mode) if {
    mode == "CONCURRENT_ZONES"
}

# Disruption Budget Policy
# Enforces limits on disruption budgets to prevent excessive simultaneous patching
deny contains msg if {
    resource := tfplan.root_module.resources[_]
    resource.type == "google_os_config_patch_deployment"
    rollout := resource.values.rollout
    disruption_budget := rollout[0].disruption_budget
    
    # Check if fixed budget is too high
    fixed := disruption_budget[0].fixed
    fixed > 10
    
    msg := sprintf("Patch deployment %s has excessive disruption budget (fixed: %d). Maximum allowed is 10", [resource.values.patch_deployment_id, fixed])
}

deny contains msg if {
    resource := tfplan.root_module.resources[_]
    resource.type == "google_os_config_patch_deployment"
    rollout := resource.values.rollout
    disruption_budget := rollout[0].disruption_budget
    
    # Check if percentage budget is too high
    percentage := disruption_budget[0].percentage
    percentage > 20
    
    msg := sprintf("Patch deployment %s has excessive disruption budget (percentage: %d). Maximum allowed is 20%%", [resource.values.patch_deployment_id, percentage])
}

# Patch Frequency Policy
# Ensures patches are scheduled at least once per month
deny contains msg if {
    resource := tfplan.root_module.resources[_]
    resource.type == "google_os_config_patch_deployment"
    recurring_schedule := resource.values.recurring_schedule
    
    # Check if monthly schedule exists
    not has_monthly_schedule(recurring_schedule)
    
    # Check if weekly schedule exists
    not has_weekly_schedule(recurring_schedule)
    
    msg := sprintf("Patch deployment %s must be scheduled at least once per month", [resource.values.patch_deployment_id])
}

has_monthly_schedule(schedule) if {
    schedule[_].monthly
}

has_weekly_schedule(schedule) if {
    schedule[_].weekly
}

# OS Type Coverage Policy
# Ensures guest policies specify OS types for better targeting
deny contains msg if {
    resource := tfplan.root_module.resources[_]
    resource.type == "google_os_config_guest_policies"
    assignment := resource.values.assignment
    os_types := assignment[0].os_types
    count(os_types) == 0
    msg := sprintf("Guest policy %s must specify at least one OS type for targeting", [resource.values.guest_policy_id])
}
