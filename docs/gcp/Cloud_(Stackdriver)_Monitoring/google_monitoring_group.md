## 🛡️ Policy Deployment Engine: `google_monitoring_group`

This section provides a concise policy evaluation for the `google_monitoring_group` resource in GCP.

Reference: [Terraform Registry – google_monitoring_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | User-assigned name for the group. | true | false | Display metadata with no security impact. | None | None |
| `filter` | Filter used to determine which monitored resources belong to the group. | true | false | Functional selector with no direct security impact; the filter defines membership, not access control. | None | None |
| `parent_name` | The name of the group's parent group, if any. | false | false | Structural hierarchy field with no security impact. | None | None |
| `is_cluster` | If true, members are treated as a cluster for additional analysis. | false | false | Analytical setting with no security impact. | None | None |
| `project` | The project in which the group resides. | false | false | Organisational field, not a security control. | None | None |

---

## Policies Written

None. No attributes in this resource present a meaningful security control opportunity. The resource defines logical groupings of monitored resources and does not configure access, encryption, authentication, or network exposure.

## Policies Considered but Not Written

| Attribute | Reason |
|-----------|--------|
| `filter` | The filter string defines group membership logic and is application-specific; no security baseline can be applied generically |
| `is_cluster` | Cluster analysis is an operational feature with no security implications |
