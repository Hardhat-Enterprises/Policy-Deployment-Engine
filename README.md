# 🚀 Policy Deployment Engine

## 📘 Project Overview

**Policy Deployment Engine** is an automated framework for validating Google Cloud Platform (GCP) infrastructure-as-code (IaC) configurations. It combines **Terraform**, **Open Policy Agent (OPA)**, and **Rego** to enforce compliance, security policies, and naming conventions across cloud deployments.

By converting Terraform plans to JSON and evaluating them against custom-defined Rego policies, this engine standardizes cloud infrastructure and integrates seamlessly into CI/CD pipelines.

---

## ⚙️ Technologies Used

- **Terraform** – Define and provision infrastructure using declarative configuration.
- **Open Policy Agent (OPA)** – General-purpose policy engine for compliance enforcement.
- **Rego** – Policy definition language used with OPA.
- **GCP (Google Cloud Platform)** – Target environment for infrastructure validation.
- **JSON** – Terraform plans are rendered as JSON for policy evaluation.
- **Shell / CLI** – Used to execute Terraform and OPA workflows.

---

## 📁 Project Structure

```bash
.
├── inputs/
│   ├── aws/
│   ├── azure/
│   └── gcp/
│       └── compute/instance/
│           ├── boot_disk/
│           ├── deletion_protection/
│           ├── desired_status/
│           ├── interface/
│           ├── machine_type/
│           └── zone/
│       └── endpoints/service/
│           └── service_name/

├── policies/
│   ├── aws/
│   ├── azure/
│   └── gcp/
│       ├── _helpers/
│       ├── compute/instance/
│       │   ├── boot_disk/
│       │   ├── deletion_protection/
│       │   ├── desired_status/
│       │   ├── interface/
│       │   ├── machine_type/
│       │   └── zone/
│       └── endpoints/service/
│           └── service_name/

├── templates/
├── .gitignore
└── README.md
```

Each subdirectory under `inputs/gcp/compute/instance/` contains:
- `c.tf` – Compliant Terraform configuration
- `nc.tf` – Non-compliant Terraform configuration
- `plan.json` – Terraform plan output in JSON format

---

## 🚀 How to Run

### 1. Generate a Terraform Plan

```bash
terraform init
terraform plan -out=plan
terraform show -json plan > plan.json
```

### 2. Evaluate Using OPA

```bash
opa eval \
  --data policies/gcp \
  --input inputs/gcp/compute/instance/<policy_name>/plan.json \
  --format pretty \
  "data.terraform.gcp.compute.instance.<policy_name>.message"
```

💡 Replace `<policy_name>` with one of:
boot_disk, deletion_protection, desired_status, interface, machine_type, zone, etc.

---

## 📋 Example Policy Use Cases

- ✅ Ensure `boot_disk.auto_delete` is set correctly
- ✅ Validate `deletion_protection` is enabled for production VMs
- ✅ Enforce `desired_status` is not TERMINATED
- ✅ Check that the `zone` aligns with organizational policy
- ✅ Verify `interface.network` and other interface settings
- ✅ Confirm naming patterns for `service_name` in Cloud Endpoints

---

## 👤 Author
Chathura Dandeniya