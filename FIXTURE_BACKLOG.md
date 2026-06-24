# Fixture backlog

Most backlog fixtures have been auto-resolved: dependency resources removed,
computed references (`.id`/`.name`/etc.) replaced with realistic GCP fake values
built from each dependency's own literals, and resources relabelled to the
compliant_example_N / non_compliant_example_N convention.

> ⚠️ The injected fake values are best-effort GCP formats and have NOT been
> validated with `terraform plan` (no terraform/OPA in the authoring env).
> Run a plan pass over the changed inputs before relying on them.

## Remaining manual files (28)

Detect anytime with: python scripts/linters/linter.py --content-checks

These were held back from the automated pass because they contain `${...}`
interpolations / heredocs, a quoted ref, or are missing the tested resource:

- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_level_condition/device_policy.allowed_device_management_levels/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_level_condition/device_policy.allowed_encryption_statuses/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_level_condition/device_policy.os_constraints.minimum_version/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_level_condition/ip_subnetworks/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_level_condition/members/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_level_condition/negate/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_level_condition/required_access_levels/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_levels/access_levels.basic.conditions.device_policy.allowed_device_management_levels/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_levels/access_levels.basic.conditions.device_policy.os_constraints.minimum_version/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_levels/access_levels.basic.conditions.device_policy.require_admin_approval/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_levels/access_levels.basic.conditions.device_policy.require_corp_owned/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_levels/access_levels.basic.conditions.ip_subnetworks/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_levels/access_levels.basic.conditions.members/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_levels/access_levels.basic.conditions.negate/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_levels/access_levels.basic.conditions.required_access_levels/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_ingress_policy/ingress_policy_name/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_ingress_policy/resource/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_service_perimeter_dry_run_resource/perimeter_name/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_service_perimeter_dry_run_resource/resource/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_service_perimeter_resource/perimeter_name/compliant.tf
- inputs/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_service_perimeter_resource/resource/compliant.tf
- inputs/gcp/App Engine/google_app_engine_standard_app_version/service/compliant.tf
- inputs/gcp/Backup for GKE/google_gke_backup_restore_channel/name/compliant.tf
- inputs/gcp/Backup for GKE/google_gke_backup_restore_channel/name/nonCompliant.tf
- inputs/gcp/OS Config v2/google_os_config_v2_policy_orchestrator_for_folder/action/compliant.tf
- inputs/gcp/OS Config v2/google_os_config_v2_policy_orchestrator_for_folder/orchestrated_resource.os_policy_assignment_v1_payload.instance_filter.inventories.os_short_name/compliant.tf
- inputs/gcp/OS Config v2/google_os_config_v2_policy_orchestrator_for_folder/orchestration_scope.selectors.location_selector.included_locations/compliant.tf
- inputs/gcp/Workflows/google_workflows_workflow/service_account/compliant.tf

Notes:
- Backup for GKE `google_gke_backup_restore_channel/name`: tested resource is
  missing entirely (only a `...restore_plan` dependency present) — must be authored.
- App Engine / Workflows: contain `${}`/heredoc interpolations (and App Engine has
  a ref accidentally wrapped in quotes) — fix the references by hand.
- Access Context Manager: access-level/policy references live inside `${}`
  interpolations; replace with fake values manually.
