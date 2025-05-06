import sys
import os
import subprocess

def run_command(cmd, desc=None, cwd=None, print_output=False):
    """
    Run a shell command with optional description.
    If print_output is True, display the command's stdout even on success.
    """
    if desc:
        print(desc)
    result = subprocess.run(cmd, shell=True, cwd=cwd, capture_output=True, text=True)
    if result.returncode != 0:
        print("Error while running command:")
        print(result.stdout)
        print(result.stderr)
        sys.exit(result.returncode)
    if print_output:
        print(result.stdout)

def main():
    if len(sys.argv) != 3:
        print("Usage: python run_policy_check.py <target_directory> <attribute>")
        print("Example: python run_policy_check.py inputs/gcp/google_kms/google_kms_crypto_key_version/state state")
        sys.exit(1)

    target_directory = sys.argv[1].strip().rstrip("\\/")
    provided_attribute = sys.argv[2].strip()

    if not os.path.isdir(target_directory):
        print(f"Error: The target directory '{target_directory}' does not exist.")
        sys.exit(1)

    # Expecting <service>/<resource>/<attribute>
    parts = target_directory.replace("\\", "/").split("/")
    if len(parts) < 3:
        print("Error: Directory structure must contain at least <service>/<resource>/<attribute> at the end.")
        sys.exit(1)

    service_name = parts[-3]
    resource = parts[-2]
    attribute = parts[-1]
    if attribute != provided_attribute:
        print(f"Warning: Provided attribute '{provided_attribute}' does not match the directory's attribute '{attribute}'")
        attribute = provided_attribute

    print(f"Detected service: '{service_name}'")
    print(f"Detected resource: '{resource}'")
    print(f"Detected attribute: '{attribute}'")

    root_dir = os.getcwd()
    policies_dir = os.path.join(root_dir, "policies", "gcp")

    # Change into target directory and record its absolute path
    os.chdir(target_directory)
    current_dir = os.getcwd()
    print(f"Changed directory to {current_dir}")

    plan_path = os.path.join(current_dir, "plan.json")
    #if not os.path.exists(plan_path):
     #   print("Error: plan.json was not generated.")
      #  sys.exit(1)

    # Construct OPA query and command for later use
    opa_query = f"data.terraform.gcp.security.{service_name}.{resource}.{attribute}.summary.message"
    opa_cmd = f'opa eval --data "{policies_dir}" --input "{plan_path}" --format pretty "{opa_query}"'

    # Prepare the commands dictionary (these commands can be re-run if desired)
    commands = {
        "1": {"cmd": "terraform init", "desc": "▶ Running terraform init...", "cwd": current_dir, "print_output": False},
        "2": {"cmd": "terraform plan -out=plan", "desc": "▶ Running terraform plan...", "cwd": current_dir, "print_output": False},
        "3": {"cmd": "terraform show -json plan > plan.json", "desc": "▶ Running terraform show...", "cwd": current_dir, "print_output": False},
        "4": {"cmd": opa_cmd, "desc": f"▶ Running OPA policy check for: {opa_query}...", "cwd": current_dir, "print_output": True}
    }

    # Loop over user input until they choose to exit (press 5)
    while True:
        print("\nEnter command numbers separated by commas (1:init, 2:plan, 3:show, 4:opa, 5:exit): or hit Enter to run all")
        user_input = input().strip()
        if user_input == "5":
            print("Exiting script.")
            sys.exit(0)
        elif user_input == "":
            # If blank, run all commands in order
            for key in ["1", "2", "3", "4"]:
                run_command(commands[key]["cmd"], commands[key]["desc"], cwd=commands[key]["cwd"], print_output=commands[key]["print_output"])
                print(f"Command {key} completed successfully.\n")
        else:
            # Split the user input on commas and run selected commands
            selected_commands = [x.strip() for x in user_input.split(",")]
            for key in selected_commands:
                if key in commands:
                    run_command(commands[key]["cmd"], commands[key]["desc"], cwd=commands[key]["cwd"], print_output=commands[key]["print_output"])
                    print(f"Command {key} completed successfully.\n")
                else:
                    print(f"Warning: Command {key} is not recognized.")

if __name__ == "__main__":
    main()
