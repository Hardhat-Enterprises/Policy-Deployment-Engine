import subprocess
import json
import os
import sys

# CONFIGURABLE
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
REGO_POLICY_DIR = "../../policies"
PLAN_DIR = "plans"
TFPLAN_BIN = os.path.join(PLAN_DIR, "tfplan.binary")
TFPLAN_JSON = os.path.join(PLAN_DIR, "tfplan.json")
COMPLIANCE_REPORT = "../../docs/compliance_report.txt"  # move to docs

def run_command(command, check=True):
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode != 0 and check:
        print(f"❌ Command failed: {command}")
        print(result.stderr)
        sys.exit(1)
    return result.stdout.strip()

def terraform_plan():
    print("📦 Running Terraform plan...")
    os.makedirs(PLAN_DIR, exist_ok=True)
    run_command("terraform init -input=false", check=False)
    run_command(f"terraform plan -out={TFPLAN_BIN}")
    run_command(f"terraform show -json {TFPLAN_BIN} > {TFPLAN_JSON}")
    print("✅ Terraform plan exported as JSON.")

def opa_validate():
    print("🔍 Validating plan with OPA...\n")

    policies = {
    "disk_size": "data.disk.size.deny",
    "machine_type": "data.machine_type.machine_type.deny",
    "os_type": "data.os_type.os_type.deny",
    "region": "data.region.region.deny",
    "zone": "data.zone.zone.deny",
    "vm_series": "data.vm_series.vm_series.deny"
    }


    violations_found = False
    report_lines = []
    report_lines.append("🧾 Terraform Compliance Report")
    report_lines.append("===================================")

    for name, query in policies.items():
        print(f"🔎 Checking policy: {name}")
        report_lines.append(f"\n🔎 Policy: {name}")

        result = run_command(
            f"opa eval --format=json --input {TFPLAN_JSON} --data {REGO_POLICY_DIR} '{query}'", check=False
        )

        try:
            response = json.loads(result)
            result_set = response.get("result", [])
            if result_set and "expressions" in result_set[0]:
                values = result_set[0]["expressions"][0]["value"]
                if values:
                    violations_found = True
                    for msg in values:
                        print(f"   ❌ {msg}")
                        report_lines.append(f"   ❌ {msg}")
                else:
                    print(f"   ✅ Passed")
                    report_lines.append(f"   ✅ Passed")
            else:
                print(f"   ⚠️ No response from policy: {name}")
                report_lines.append(f"   ⚠️ No response from policy engine.")
        except json.JSONDecodeError:
            print(f"   ❌ Failed to parse OPA output for policy: {name}")
            report_lines.append("   ❌ Failed to parse OPA output.")

    # Write to report file
    with open(COMPLIANCE_REPORT, "w") as f:
        f.write("\n".join(report_lines))

    print("\n📝 Compliance report saved to 'compliance_report.txt'\n")
    return not violations_found

def terraform_apply():
    print("🚀 Applying infrastructure...")
    run_command(f"terraform apply {TFPLAN_BIN}")

def update_project_id_from_credentials():
    credentials_path = os.path.join(BASE_DIR, "../secrets/credentials.json")
    tfvars_path = os.path.join(BASE_DIR, "../inputs/gcp/terraform.tfvars")

    # Load project_id from credentials.json
    with open(credentials_path, 'r') as f:
        creds = json.load(f)
    project_id = creds.get("project_id")

    # Read tfvars content
    with open(tfvars_path, 'r') as f:
        lines = f.readlines()

    # Replace or insert project_id line
    updated = False
    for i, line in enumerate(lines):
        if "project_id" in line:
            lines[i] = f'project_id = "{project_id}"\n'
            updated = True
            break
    if not updated:
        lines.insert(0, f'project_id = "{project_id}"\n')

    # Write back to tfvars
    with open(tfvars_path, 'w') as f:
        f.writelines(lines)

    print(f"✅ project_id updated in terraform.tfvars")

if __name__ == "__main__":
    update_project_id_from_credentials()
    os.chdir(os.path.abspath("../inputs/gcp")) # Added working DIR
    terraform_plan()
    if opa_validate():
        terraform_apply()
    else:
        print("🛑 Aborting apply due to policy violation.")
