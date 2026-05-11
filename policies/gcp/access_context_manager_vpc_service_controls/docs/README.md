GCP Access Context Manager Security Documentation
This document outlines the security justifications and parameter references for the Access Context Manager resources configured in this repository.

1. google_access_context_manager_access_level_condition
ip_subnetworks: Policy Written. Restricts access requests to authorized IP ranges to prevent unauthorized remote entry.

allowed_encryption_statuses: Policy Written. Requires active device disk encryption to prevent physical data leaks.

negate: Policy Written. Prevents logic inversion that could cause unintended broad access.

minimum_version: Policy Written. Enforces a baseline operating system version for endpoint security.

allowed_device_management_levels: Policy Written. Ensures devices meet required management security tiers like COMPLETE.

members: Policy Written. Restricts access to a specific list of approved identities.

required_access_levels: Policy Written. Mandates compliance with prerequisite access levels.

access_level: No Policy. Required system field defining the parent resource identifier with no security logic.

2. google_access_context_manager_access_levels
ip_subnetworks: Policy Written. Limits the source of access requests to specific IP blocks.

members: Policy Written. Validates that only approved accounts can trigger this access level.

required_access_levels: Policy Written. Ensures compliance with upstream security dependencies.

negate: Policy Written. Blocks logic inversion to maintain a positive security model.

allowed_device_management_levels: Policy Written. Confirms devices are under corporate control before granting access.

require_corp_owned: Policy Written. Limits access to company issued hardware to reduce data leak risks.

require_admin_approval: Policy Written. Mandates a manual review process for high risk access requests.

minimum_version: Policy Written. Validates that the endpoint operating system is patched and current.

parent: No Policy. Structural string defining the organization hierarchy.

name: No Policy. Identifier managed by the system.

title: No Policy. Descriptive label used for human identification only.

3. google_access_context_manager_service_perimeter_resource
perimeter_name: Policy Written. Ensures resources are attached only to authorized security boundaries.

resource: Policy Written. Prevents data exfiltration by whitelisting specific project attachments.

Note: All configurable arguments for this resource have strict security policies applied.

4. google_access_context_manager_service_perimeter_dry_run_resource
perimeter_name: Policy Written. Validates the target perimeter during the testing phase.

resource: Policy Written. Limits dry run project associations to approved environments.

Note: All configurable arguments for this resource have strict security policies applied.

5. google_access_context_manager_ingress_policy
ingress_policy_name: Policy Written. Confirms the policy maps to the correct authorized service perimeter.

resource: Policy Written. Restricts ingress project resources to those on the approved list.