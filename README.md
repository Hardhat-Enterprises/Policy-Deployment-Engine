# 🛡️ GCP Azure Terraform Policies – Helper-Based Upgrade

This folder contains a set of upgraded Rego policies for Google Cloud Platform (GCP) Azure-based Terraform resources, aligned with the Policy Deployment Engine (PDE) framework. All policies are written using `get_multi_summary()` and structured helper functions, offering reusable logic, consistent formatting, and user-friendly outputs.

---

## ✅ Resources Covered

- `google_container_azure_client`
- `google_container_azure_cluster`
- `google_container_azure_node_pool`

---

## 📜 Upgraded Policies

| Resource                        | Policy Name               | Description                                              |
|--------------------------------|---------------------------|----------------------------------------------------------|
| `google_container_azure_client`| `tenant_id_whitelist`     | Only allows approved tenant IDs                          |
| `google_container_azure_client`| `location_blacklist`      | Prevents use of blocked Azure locations                  |
| `google_container_azure_client`| `location_whitelist`      | Enforces usage of whitelisted Azure locations            |
| `google_container_azure_client`| `project_whitelist`       | Validates project names against a whitelist              |
| `google_container_azure_client`| `name_prefix`             | Requires client name to start with a defined prefix      |
| `google_container_azure_cluster`| `admin_users_present`    | Ensures only approved admin usernames are used           |
| `google_container_azure_cluster`| `azure_region_whitelist` | Validates Azure region usage against allowed regions     |
| `google_container_azure_cluster`| `name_prefix`            | Enforces naming convention for cluster names             |
| `google_container_azure_cluster`| `fleet_project_whitelist`| Validates fleet.project field against approved values    |
| `google_container_azure_node_pool`| `vm_size_whitelist`    | Requires use of specific, approved VM sizes              |

---

## 🧪 How to Test

Each policy can be tested using the OPA CLI:

```bash
opa eval --data ./policies/gcp --data ./helpers --input ./inputs/<resource>/<policy>/plan.json --format pretty "data.terraform.gcp.<resource_path>.<policy>.message"
