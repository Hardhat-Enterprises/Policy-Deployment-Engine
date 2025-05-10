# Terraform + OPA Policy Enforcement

This project provides automated compliance enforcement for Terraform plans using Open Policy Agent (OPA). Policies are written in Rego and enforced automatically via a Python script.

## 🔍 What This Project Does

- Parses Terraform plans
- Validates them against custom OPA policies
- Generates a detailed compliance report
- Blocks apply if any policy violations are found

## 📦 Project Structure

```bash
.
├── Automation_terraform_with_OPA.py   # Python automation script
├── policies/                          # Rego policy modules
├── tfplan.binary                      # Terraform binary plan output
├── tfplan.json                        # JSON form of Terraform plan
├── compliance_report.txt              # Output compliance report
├── policy_document.md                 # Detailed documentation of enforced policies
```

## 🔒 Enforced Policies

| Policy           | Description                                      |
|------------------|--------------------------------------------------|
| Disk Size        | Boot disk must not exceed 20 GB                  |
| Zone Restriction | Only allows zones in southeast Australia         |
| Machine Type     | Only shared-core and standard machines allowed   |
| OS Type          | Only CentOS and Debian OS images allowed         |
| VM Series        | Only `e2-` series VMs are allowed                |
| Region           | Only southeast Australia regions are accepted    |

## 🚀 How to Use

1. Write your Terraform plan (e.g. `main.tf`)
2. Run the automation script:

```bash
python Automation_terraform_with_OPA.py
```

3. View the results in `compliance_report.txt`

## 📄 Compliance Report

Every run generates a `compliance_report.txt` showing which policies passed or failed, and why.

## 🧩 Extending Policies

To add a new policy:

1. Add a new `.rego` file to the `policies/` directory
2. Reference it in `opa_validate()` inside the Python script
3. Document it in `policy_document.md`

## 👤 Author

Chathura Dandeniya
