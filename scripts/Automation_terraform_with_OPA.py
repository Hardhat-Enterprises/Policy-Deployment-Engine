import subprocess
import json
import os
import sys
import logging
import shutil


# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[
        logging.StreamHandler()
    ]
)

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
        logging.error(f"❌ Command failed: {command}")
        print(result.stderr)
        sys.exit(1)
    return result.stdout.strip()

def terraform_plan():
    logging.info("📦 Running Terraform plan...")
    try:
        os.makedirs(PLAN_DIR, exist_ok=True)
        run_command("terraform init -input=false", check=False)
        run_command(f"terraform plan -out={TFPLAN_BIN}")
        run_command(f"terraform show -json {TFPLAN_BIN} > {TFPLAN_JSON}")
        logging.info("✅ Terraform plan exported as JSON.")
    except subprocess.CalledProcessError as e:
        logging.error(f"❌ Terraform command failed: {e}")
        sys.exit(1)
    except OSError as e:
        logging.error(f"❌ Filesystem error while creating directories or writing files: {e}")
        sys.exit(1)
    except Exception as e:
        logging.error(f"❌ Unexpected error in terraform_plan(): {e}")
        sys.exit(1)

def opa_validate():
    logging.info("🔍 Validating plan with OPA...\n")

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
        logging.info(f"🔎 Checking policy: {name}")
        report_lines.append(f"\n🔎 Policy: {name}")

        try:
            result = run_command(
                f"opa eval --format=json --input {TFPLAN_JSON} --data {REGO_POLICY_DIR} '{query}'", check=False
            )
        except Exception as e:
            logging.error(f" ❌ OPA evaluation failed: {e}")
            sys.exit(1)

        try:
            response = json.loads(result)
            result_set = response.get("result", [])
            if result_set and "expressions" in result_set[0]:
                values = result_set[0]["expressions"][0]["value"]
                if values:
                    violations_found = True
                    for msg in values:
                        logging.error(f"   ❌ {msg}")
                        report_lines.append(f"   ❌ {msg}")
                else:
                    logging.info(f"   ✅ Passed")
                    report_lines.append(f"   ✅ Passed")
            else:
                logging.warning(f"   ⚠️ No response from policy: {name}")
                report_lines.append(f"   ⚠️ No response from policy engine.")
        except json.JSONDecodeError:
            logging.error(f"   ❌ Failed to parse OPA output for policy: {name}")
            report_lines.append("   ❌ Failed to parse OPA output.")

    # Write to report file
    with open(COMPLIANCE_REPORT, "w") as f:
        f.write("\n".join(report_lines))

    logging.info("📝 Compliance report saved to 'compliance_report.txt'\n")
    return not violations_found

def terraform_apply():
    logging.info("🔍 Generating infrastructure summary before apply...")

    # Show a human-readable summary of the tfplan
    try:
        summary = run_command(f"terraform show {TFPLAN_BIN}")
        print("\n📋 Terraform Plan Summary:\n")
        print(summary)
    except Exception as e:
        logging.error(f"❌ Failed to show terraform plan: {e}")
        sys.exit(1)

    # Ask for user confirmation
    confirm = input("\n⚠️  Are you sure you want to apply this infrastructure? (yes/no): ")
    if confirm.strip().lower() != "yes":
        logging.info("ℹ️  Terraform apply canceled by user.")
        return

    # Proceed with apply
    logging.info("🚀 Applying infrastructure...")
    try:
        run_command(f"terraform apply {TFPLAN_BIN}")
        logging.info("✅ Infrastructure applied successfully.")
    except Exception as e:
        logging.error(f"❌ Failed to apply infrastructure: {e}")
        sys.exit(1)


def validate_binaries():
    for binary in ["terraform", "opa"]:
        if shutil.which(binary) is None:
            logging.error(f"❌ '{binary}' is not installed or not found in PATH.")
            sys.exit(1)
    logging.info("✅ Terraform and OPA are installed and available.")

def update_project_id_from_credentials():
    credentials_path = os.path.join(BASE_DIR, "../secrets/credentials.json")
    tfvars_path = os.path.join(BASE_DIR, "../inputs/gcp/terraform.tfvars")

    # Load project_id from credentials.json
    try:
        with open(credentials_path, 'r') as f:
            creds = json.load(f)
        project_id = creds.get("project_id")
    except FileNotFoundError:
        logging.error(f" ❌ Credentials file not found: {credentials_path}")
        sys.exit(1)
    except json.JSONDecodeError:
        logging.error(f" ❌ Invalid JSON format in credentials file.")
        sys.exit(1)

    # Read tfvars content
    try:
        with open(tfvars_path, 'r') as f:
            lines = f.readlines()
    except FileNotFoundError:
        logging.error(f" ❌ Terraform tfvars file not found: {tfvars_path}")
        sys.exit(1)
    except Exception as e:
        logging.error(f" ❌ Unexpected error reading tfvars file: {e}")
        sys.exit(1)

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

    logging.info(f"✅ project_id updated in terraform.tfvars")

if __name__ == "__main__":
    validate_binaries()
    update_project_id_from_credentials()
    os.chdir(os.path.abspath("../inputs/gcp")) # Added working DIR
    terraform_plan()
    if opa_validate():
        terraform_apply()
    else:
        logging.error("🛑 Aborting apply due to policy violation.")
