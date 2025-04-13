
# 🚀 Terraform + OPA Policy Enforcement with Dynamic GCP Context

This branch of the project provides automated compliance enforcement for Terraform plans using Open Policy Agent (OPA). Policies are modular, cloud-aware, and dynamically injected with GCP context (like `project_id`) extracted from a service account JSON file.

---

## 🔍 What This Project Does

- Parses Terraform plans (`terraform plan`)
- Dynamically injects `project_id` from `credentials.json`
- Validates against custom OPA policies written in Rego
- Blocks infrastructure changes if any policy violations occur
- Generates a human-readable compliance report

---

## 📁 Project Structure

```bash
.
├── scripts/
│   └── Automation_terraform_with_OPA.py   # Main Python automation script
├── inputs/
│   └── gcp/
│       ├── main.tf                        # Terraform config
│       ├── terraform.tfvars               # Variable values (updated automatically)
│       └── plans/                         # tfplan binary & json outputs
├── policies/
│   └── gcp/
│       └── compute/                       # All Rego policy modules
├── secrets/
│   └── credentials.json                   # GCP service account credentials
├── docs/
│   └── compliance_report.txt              # Output compliance report
│   └── policy_document.md                 # Human-readable policy summary
```

---

## 🔐 Enforced Policies

| Policy             | Description                                                 |
|--------------------|-------------------------------------------------------------|
| Disk Size          | Boot disk must not exceed 20 GB                             |
| Zone Restriction   | Only zones in southeast Australia are allowed               |
| Machine Type       | Only shared-core and standard machines are permitted        |
| OS Type            | Only CentOS and Debian OS images are allowed                |
| VM Series          | Only `e2-` series VMs are accepted                          |
| Region Restriction | Only southeast Australian regions (`australia-southeast1/2`) |

---

## ⚙️ How It Works

1. Reads `project_id` from `secrets/credentials.json`
2. Injects/updates it into `inputs/gcp/terraform.tfvars`
3. Runs `terraform plan` and exports a JSON plan
4. Validates the plan using OPA against Rego policies
5. Applies infrastructure **only if all policies pass**

---

## 📄 Compliance Report

Each run generates:
- `docs/compliance_report.txt`: Shows policy pass/fail breakdown

Example:
```
✅ Disk size compliant
❌ VM series must be e2-*
❌ Region must be australia-southeast1 or southeast2
```

---

## 🧩 Extending the Policy Engine

To add a new policy:
1. Add a `.rego` file inside the appropriate folder under `policies/gcp/compute/`
2. Ensure it has a `deny[msg]` rule
3. Import it in `main.rego` and update the `import data...` path
4. Add an entry to the `policies = {}` dictionary in the Python script

---

## 🧠 Smart Features

- 🧠 Dynamic `project_id` injection from credentials
- 🔄 Modular Rego policy structure
- 💥 Apply blocked on policy violation
- 📦 Self-organizing folder structure

---

## 👤 Author

Chathura Dandeniya
