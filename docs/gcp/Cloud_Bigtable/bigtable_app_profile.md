## 🛡️ Policy Deployment Engine: `bigtable_app_profile`

This section provides a concise policy evaluation for the `bigtable_app_profile` resource in GCP.

Reference: [Terraform Registry – bigtable_app_profile](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_app_profile)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `app_profile_id` | The unique name of the app profile in the form `[_a-zA-Z0-9][-_.a-zA-Z0-9]*`. | false | false | Terraform resource name for this app profile; used with routing blocks to identify traffic policy. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `description` | Long form description of the use case for this app profile. | false | false | Operator-facing notes about why this profile exists; does not change IAM or encryption by itself. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `multi_cluster_routing_use_any` | If true, read/write requests are routed to the nearest cluster in the instance, and will fail over to the nearest cluster that is available in the event of transient errors or delays. Clusters in a region are considered equidistant. Choosing this option sacrifices read-your-writes consistency to improve availability. | false | false | When enabled, sends requests to the nearest cluster for availability; differs from strict read-your-writes consistency. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `single_cluster_routing` | Use a single-cluster routing policy. Structure is [documented below](#nested_single_cluster_routing). | false | false | Nested block that pins routing to one cluster when multi-cluster-any routing is not used. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `standard_isolation` | The standard options used for isolating this app profile's traffic from other use cases. Structure is [documented below](#nested_standard_isolation). | false | false | Optional traffic isolation bucket so workloads do not contend on shared priority. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `data_boost_isolation_read_only` | Specifies that this app profile is intended for read-only usage via the Data Boost feature. Structure is [documented below](#nested_data_boost_isolation_read_only). | false | false | Marks this profile as read-only analytics via Data Boost. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `instance` | The name of the instance to create the app profile within. | false | false | Bigtable instance this app profile belongs to. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `ignore_warnings` | If true, ignore safety checks when deleting/updating the app profile. | false | true | Ignoring warnings can bypass safety checks and increase risk during updates/deletes. | false | true |
| `project` | If it is not provided, the provider project is used. | false | false | GCP project ID for API calls and billing context. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |

### single_cluster_routing Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster_id` | The cluster to which read/write requests should be routed. | true | false | Names the cluster that receives reads and writes under single-cluster routing. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `allow_transactional_writes` | If true, CheckAndMutateRow and ReadModifyWriteRow requests are allowed by this app profile. It is unsafe to send these requests to the same table/row/column in multiple clusters. | false | true | This control requires transactional writes to remain disabled for single-cluster routing under your governance standard. | false | true |

### standard_isolation Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `priority` | The priority of requests sent using this app profile. Possible values are: `PRIORITY_LOW`, `PRIORITY_MEDIUM`, `PRIORITY_HIGH`. | true | false | Priority tier for isolated traffic (`PRIORITY_LOW`, `PRIORITY_MEDIUM`, `PRIORITY_HIGH`). It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |

### data_boost_isolation_read_only Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `compute_billing_owner` | The Compute Billing Owner for this Data Boost App Profile. Possible values are: `HOST_PAYS`. | true | false | Who pays for Data Boost compute (`HOST_PAYS`). It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
