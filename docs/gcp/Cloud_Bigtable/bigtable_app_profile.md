## 🛡️ Policy Deployment Engine: `bigtable_app_profile`

This section provides a concise policy evaluation for the `bigtable_app_profile` resource in GCP.

Reference: [Terraform Registry – bigtable_app_profile](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_app_profile)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `app_profile_id` | The unique name of the app profile in the form `[_a-zA-Z0-9][-_.a-zA-Z0-9]*`. | false | false | `app_profile_id` is only a stable name for this profile in Terraform and APIs; it is not a credential or secret and does not determine who may call Bigtable—IAM does. | None | None |
| `description` | Long form description of the use case for this app profile. | false | false | Free-text operator notes for consoles and audits; changing it does not alter routing rules, IAM bindings, or encryption settings. | None | None |
| `multi_cluster_routing_use_any` | If true, read/write requests are routed to the nearest cluster in the instance, and will fail over to the nearest cluster that is available in the event of transient errors or delays. Clusters in a region are considered equidistant. Choosing this option sacrifices read-your-writes consistency to improve availability. | false | false | Controls routing/failover behavior for availability and consistency; it does not add principals to IAM or bypass authentication on the client API. | None | None |
| `single_cluster_routing` | Use a single-cluster routing policy. Structure is [documented below](#nested_single_cluster_routing). | false | false | A structural block that chooses single-cluster routing; the block tag itself is not a secret and does not grant access—child fields set the actual target cluster and transactional policy. | None | None |
| `standard_isolation` | The standard options used for isolating this app profile's traffic from other use cases. Structure is [documented below](#nested_standard_isolation). | false | false | Groups priority-based isolation for noisy-neighbor control; it tunes scheduling priority, not IAM membership or encryption keys. | None | None |
| `data_boost_isolation_read_only` | Specifies that this app profile is intended for read-only usage via the Data Boost feature. Structure is [documented below](#nested_data_boost_isolation_read_only). | false | false | Marks the profile as read-only for Data Boost analytics paths; it does not replace IAM checks or leak credentials. | None | None |
| `instance` | The name of the instance to create the app profile within. | false | false | References which Bigtable instance this profile belongs to; instance names are identifiers in config/API and do not embed IAM grants. | None | None |
| `ignore_warnings` | If true, ignore safety checks when deleting/updating the app profile. | false | true | Ignoring warnings can bypass safety checks and increase risk during updates/deletes. | false | true |
| `project` | If it is not provided, the provider project is used. | false | false | Non-secret project identifier used for API routing/billing context; it does not substitute for verifying callers or roles. | None | None |

### single_cluster_routing Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster_id` | The cluster to which read/write requests should be routed. | true | false | Names a cluster to receive traffic; it is a non-secret resource identifier. Who may read/write is still enforced by IAM and app credentials, not this string alone. | None | None |
| `allow_transactional_writes` | If true, CheckAndMutateRow and ReadModifyWriteRow requests are allowed by this app profile. It is unsafe to send these requests to the same table/row/column in multiple clusters. | false | true | This control requires transactional writes to remain disabled for single-cluster routing under your governance standard. | false | true |

### standard_isolation Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `priority` | The priority of requests sent using this app profile. Possible values are: `PRIORITY_LOW`, `PRIORITY_MEDIUM`, `PRIORITY_HIGH`. | true | false | QoS/priority tier only; it does not expose row data or widen who can authenticate to Bigtable. | None | None |

### data_boost_isolation_read_only Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `compute_billing_owner` | The Compute Billing Owner for this Data Boost App Profile. Possible values are: `HOST_PAYS`. | true | false | Billing attribution for Data Boost compute charges only; not an access-control attribute and does not contain secrets. | None | None |
