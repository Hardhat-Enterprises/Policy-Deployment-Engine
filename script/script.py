import os
import sys
import subprocess
import json
import time
import threading
import argparse

# -----------------------
# Typing animation
# -----------------------
def type_out(text, delay=0.08):
    for char in text:
        print(char, end='', flush=True)
        time.sleep(delay)
    print()

# -----------------------
# Spinner animation
# -----------------------
def spinner(msg, done_event):
    while not done_event.is_set():
        for c in '|/-\\':
            sys.stdout.write(f'\r{msg} {c}')
            sys.stdout.flush()
            time.sleep(0.5)
    sys.stdout.write('\r' + ' ' * (len(msg) + 4) + '\r')

# -----------------------
# CLI Argument Parsing
# -----------------------
parser = argparse.ArgumentParser(description="OPA Policy Evaluation CLI")
parser.add_argument(
    "--only",
    nargs="*",
    help="Run only specific policies (e.g., --only boot_disk machine_type)"
)
args = parser.parse_args()

# -----------------------
# Path Configuration
# -----------------------
base_dir = os.path.dirname(os.path.abspath(__file__))
input_base = os.path.join(base_dir, "..", "inputs", "gcp", "compute", "instance")
policy_base = os.path.join(base_dir, "..", "policies", "gcp")
logs_dir = os.path.join(base_dir, "..", "logs")
zone_dir = os.path.join(input_base, "zone")

os.makedirs(logs_dir, exist_ok=True)

# Determine which policies to run
if args.only:
    policy_dirs = args.only
else:
    policy_dirs = [
        d for d in os.listdir(input_base)
        if os.path.isdir(os.path.join(input_base, d))
    ]

type_out("🚀 Starting OPA Policy Evaluation...\n")

for policy in policy_dirs:
    plan_path = os.path.join(input_base, policy, "plan.json")

    if not os.path.isfile(plan_path):
        print(f"❌ Skipping '{policy}': plan.json not found")
        continue

    opa_query = f"data.terraform.gcp.security.compute.instance.{policy}.message"
    command = [
        "opa", "eval",
        "--input", plan_path,
        "--data", policy_base,
        "--format", "json",
        opa_query
    ]

    print(f"📄 ===============================\n")
    print(f"🔍 Policy: {policy}")
    print(f"🛠  Command: {' '.join(command)}")

    # Spinner while OPA runs
    done = threading.Event()
    t = threading.Thread(target=spinner, args=(f"Evaluating {policy}", done))
    t.start()

    try:
        result = subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        done.set()
        t.join()
        print(f"\n✅ Evaluation complete for {policy}\n")

        parsed = json.loads(result.stdout)

        try:
            value = parsed["result"][0]["expressions"][0]["value"]
            output_lines = [f"Policy: {policy} Evaluation Result\n"]

            if isinstance(value, list):
                for item in value:
                    if isinstance(item, list):
                        output_lines.append("-" * 50)
                        for sub in item:
                            output_lines.append(f"  {sub}")
                        output_lines.append("")
                    else:
                        output_lines.append(f"{item}")
            else:
                output_lines.append(str(value))

            pretty_output = "\n".join(output_lines)
            print(pretty_output)

            with open(os.path.join(logs_dir, f"{policy}.txt"), "w") as f:
                f.write(pretty_output)

        except (KeyError, IndexError):
            print("⚠️ Could not extract policy result from JSON output")

    except json.JSONDecodeError:
        done.set()
        t.join()
        print("⚠️ Could not parse JSON output:")
        print(result.stdout)

    except subprocess.CalledProcessError as e:
        done.set()
        t.join()
        print(f"❌ Error evaluating {policy}:")
        print(e.stderr)

type_out("\n🏁 All policies evaluated.\n")
time.sleep(1)

# -----------------------
# Terraform part
# -----------------------

if os.path.isdir(zone_dir):
    print("🚀 Running Terraform plan...")
    try:
        subprocess.run(["terraform", "init", "-input=false"], cwd=zone_dir, check=True)
        subprocess.run(["terraform", "plan", "-out=plan"], cwd=zone_dir, check=True)
        subprocess.run(
            ["terraform", "show", "-json", "plan"],
            cwd=zone_dir,
            stdout=open(os.path.join(zone_dir, "plan.json"), "w"),
            check=True
        )
        print("✅ Terraform plan.json generated.")
        subprocess.run(["terraform", "apply", "-auto-approve", "-target=google_compute_instance.c"], cwd=zone_dir, check=True)
        print("✅ GCP instance successfully deployed.")
    except subprocess.CalledProcessError as e:
        print(f"❌ Terraform failed:\n{e}")