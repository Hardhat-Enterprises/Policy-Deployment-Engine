# 🛡️ GCP Policy Deployment - Rego Rules

This folder contains **Rego-based security and compliance policies** for GCP Terraform resources, specifically focused on:

- `google_container_azure_client`
- `google_container_azure_cluster`
- `google_container_azure_node_pool`

Each policy inspects the Terraform plan file (`plan.json`) and validates attributes against defined standards. Policies are grouped by resource.

---

## ✅ Resources & Policies

### 1. `google_container_azure_client`

| Policy Name                | Description                                           |
|---------------------------|-------------------------------------------------------|
| `application_id_pattern`  | Ensures Application ID matches secure naming pattern |
| `location`                | Enforces allowed/disallowed Azure client locations   |
| `project_whitelist`       | Ensures projects belong to an approved list          |
| `tenant_id_whitelist`     | Only whitelisted tenant IDs are allowed              |


---

### 2. `google_container_azure_cluster`

| Policy Name                    | Description                                               |
|--------------------------------|-----------------------------------------------------------|
| `admin_groups`                 | Requires non-empty admin_groups for authorization         |
| `admin_users_present`          | Validates presence of admin users                         |
| `azure_region_whitelist`       | Checks cluster region against an allowed list             |
| `fleet_project_whitelist`      | Ensures clusters are part of approved fleet projects      |
| `kubernetes_version_whitelist` | Enforces specific Kubernetes versions                     |
| `azure_services_authentication`| Authentication must not be disabled                       |

---

### 3. `google_container_azure_node_pool`

| Policy Name           | Description                                     |
|-----------------------|-------------------------------------------------|
| `disk_size_minimum`   | VM disk size must meet minimum threshold        |
| `node_count_range`    | Node count must fall within allowed range       |
| `vm_size_whitelist`   | Validates VM size against approved types        |

---

## 🧪 How to Run

```bash
opa eval --data ./policies/gcp --data ./helpers \
  --input ./inputs/gcp/[resource]/[policy]/plan.json \
  --format pretty "data.terraform.gcp.security.[resource_type].[resource_name].[policy_name].message"
