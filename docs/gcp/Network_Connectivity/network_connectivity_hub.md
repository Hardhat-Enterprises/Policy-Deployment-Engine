## 🛡️ Policy Deployment Engine: `network_connectivity_hub`

This section provides a concise policy evaluation for the `network_connectivity_hub` resource in GCP.

Reference: [Terraform Registry – network_connectivity_hub](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_hub)

---

### 🔍 Legend

- **Argument Required?**
  - ✅ Required
  - 🟡 Optional

- **Policy Needed?**
  - 🛡️ Policy Needed
  - 🌐 Global Policy Applies
  - ⚪ Not Needed

---

## 1. Argument Reference

### `name`
- Description: Immutable. The name of the hub. Hub names must be unique. Format: `projects/{project_number}/locations/global/hubs/{hub_id}`
- Argument Required?: ✅ Required
- Policy Needed?: 🌐 Global Policy Applies
- Decision / Rationale: `name` covered by global policies.

### `labels`
- Description: Optional labels in key:value format. Refer to [Requirements for labels](https://cloud.google.com/resource-manager/docs/creating-managing-labels#requirements).
- Argument Required?: 🟡 Optional
- Policy Needed?: ⚪ Not Needed
- Decision / Rationale: Labels hold no security impact.

### `description`
- Description: An optional description of the hub.
- Argument Required?: 🟡 Optional
- Policy Needed?: ⚪ Not Needed
- Decision / Rationale: Description holds no security impact.

### `preset_topology`
- Description: Optional. Used only when `policyMode = PRESET`. Values: `MESH`, `STAR`.
- Argument Required?: 🟡 Optional
- Policy Needed?: 🛡️ Policy Needed
- Decision / Rationale: MESH is picked by default, but  MESH or STAR should be picked explicity as MESH increases the attack surface.

### `policy_mode`
- Description: Optional. Can be `PRESET` or `CUSTOM`. Defaults to `PRESET`.
- Argument Required?: 🟡 Optional
- Policy Needed?: ⚪ Not Needed
- Decision / Rationale: Business should be able to pick their policy mode as either PRESET or CUSTOM.

### `export_psc`
- Description: Optional. Enables Private Service Connect transitivity between VPC spokes.
- Argument Required?: 🟡 Optional
- Policy Needed?: ⚪ Not Needed
- Decision / Rationale: Business requires the need to toggle export_psc on or off.

### `project`
- Description: If not set, the provider project is used.
- Argument Required?: 🟡 Optional
- Policy Needed?: ⚪ Not Needed
- Decision / Rationale: Not security related.
