import os
import re
import subprocess


class BaseValidator:
    def __init__(self, root, logger):
        self.root = root
        self.logger = logger

    def check_missing_files(self, folder, actual_files, required_files):
        missing = required_files - actual_files
        if missing:
            self.logger.log(f"Missing files in {folder}: {missing}")

    def check_excess_files(self, folder, actual_files, required_files):
        excess = actual_files - required_files
        if excess:
            self.logger.log(f"Excess files in {folder}: {excess}")

    def check_only_directories(self, folder):
        for item in os.listdir(folder):
            path = os.path.join(folder, item)
            # Allow only directories OR specific allowed files
            if os.path.isfile(path) and item not in ("vars.rego", "helpers.rego"):
                self.logger.log(f"Unexpected file '{item}' in {folder}. Only directories are allowed.")

    def validate_resource_type_matches_dir(self, tf_path, expected_type):
        """Ensure resource TYPE in file matches the resource directory name."""
        try:
            with open(tf_path, "r", encoding="utf-8") as fh:
                for line in fh:
                    s = line.strip()
                    if s.startswith("resource "):
                        parts = s.split()
                        if len(parts) >= 3:
                            resource_type = parts[1].strip('"')
                            if resource_type != expected_type:
                                self.logger.log(
                                    f"Resource type '{resource_type}' in {tf_path} does not match directory '{expected_type}'"
                                )
        except OSError as e:
            self.logger.log(f"Could not read {tf_path}: {e}")

    def validate_resource_name_sequence(self, tf_path, prefix):
        """Ensure names sequence c1.. or nc1.. inside c.tf or nc.tf."""
        names = []
        try:
            with open(tf_path, "r", encoding="utf-8") as fh:
                for line in fh:
                    s = line.strip()
                    if s.startswith("resource "):
                        parts = s.split()
                        if len(parts) >= 3:
                            names.append(parts[2].strip('"'))
            for idx, rname in enumerate(names, start=1):
                expected = f"{prefix}{idx}"
                if rname != expected:
                    self.logger.log(f"Expected resource name '{expected}' but found '{rname}' in {tf_path}")
        except OSError as e:
            self.logger.log(f"Could not read {tf_path}: {e}")
    
    def _expected_pkg(self, service, resource, policy_name):
        return f"terraform.gcp.security.{service}.{resource}.{policy_name}"

    def _read_package(self, rego_path):
        try:
            with open(rego_path, "r", encoding="utf-8") as fh:
                for line in fh:
                    m = self.PKG_RE.match(line)
                    if m:
                        return m.group(1).strip()
        except FileNotFoundError:
            return None
        return None

    def check_package_for_policy(self, folder, service, resource, policy_name):
        # sanity check path segments
        for seg, label in ((service, "service"), (resource, "resource"), (policy_name, "policy folder")):
            if not self.SEGMENT_RE.fullmatch(seg):
                self.logger.log(f"Invalid {label} segment '{seg}' in {folder}")

        policy_path = os.path.join(folder, "policy.rego")
        expected = self._expected_pkg(service, resource, policy_name)
        actual = self._read_package(policy_path)

        if actual is None:
            self.logger.log(f"No package declaration found in {policy_path}")
            return

        if actual != expected:
            self.logger.log(
                f"Bad package name in {policy_path}. Expected '{expected}', found '{actual}'"
            )

    def check_vars_package(self, service: str, resource: str, res_path: str):
            """
            Expect: package terraform.gcp.security.<service>.<resource>.vars
            File location: <root>/<service>/<resource>/vars.rego
            """
            vars_path = os.path.join(res_path, "vars.rego")
            if not os.path.exists(vars_path):
                return  # nothing to check

            expected = f"terraform.gcp.security.{service}.{resource}.vars"
            actual = self._read_package(vars_path)

            if actual is None:
                self.logger.log(f"No package declaration found in {vars_path}")
            elif actual != expected:
                self.logger.log(
                    f"Bad package name in {vars_path}. Expected '{expected}', found '{actual}'"
                )    

    



class InputValidator(BaseValidator):
    REQUIRED = {"c.tf", "nc.tf", "config.tf", "plan.json", ".terraform.lock.hcl", ".terraform", "plan"}
    VALID_NAME = re.compile(r"^[a-z0-9_]+\.tf$")

    def validate(self):
        for service in os.listdir(self.root):
            service_path = os.path.join(self.root, service)
            if not os.path.isdir(service_path): 
                self.logger.log(f"Unexpected File: '{f}' in {folder}")
                continue
            self.check_only_directories(service_path)
            subprocess.run("tf fmt -recursive")   #This will recursivelt format all the terraform file(Cna be changed to terraform(tf is shortcut))

            for resource in os.listdir(service_path):
                res_path = os.path.join(service_path, resource)
                if not os.path.isdir(res_path): 
                   # self.logger.log(f"Unexpected File: '{res_path}' in {folder}")
                    continue
                self.check_only_directories(res_path)    
                
                for policy_name in os.listdir(res_path):
                    folder = os.path.join(res_path, policy_name)
                    if not os.path.isdir(folder): continue

                    files = set(os.listdir(folder))
                    self.check_missing_files(folder, files, self.REQUIRED)
                    self.check_excess_files(folder, files, self.REQUIRED)

                    #subprocess.run("tf validate")
                    

                    for f in files:
                        if f.endswith(".tf") and not self.VALID_NAME.match(f):
                            self.logger.log(f"Bad filename: '{f}' in {folder}")


                    expected_type = os.path.basename(res_path)  # resource directory name
                    for tf_name, prefix in (("c.tf", "c"), ("nc.tf", "nc")):
                        tf_path = os.path.join(folder, tf_name)
                        if os.path.isfile(tf_path):
                            # Resource TYPE must match the resource directory
                           self.validate_resource_type_matches_dir(tf_path, expected_type)
                            # Resource NAME sequence c1.. / nc1..
                           self.validate_resource_name_sequence(tf_path, prefix) 
                        


                    




class PolicyValidator(BaseValidator):
    DEFAULT_REQUIRED = {"policy.rego", "vars.rego"}
    VALID_NAME = re.compile(r"^[a-z0-9_]+\.rego$")
    PKG_RE = re.compile(r"^\s*package\s+([A-Za-z0-9_.]+)")
    SEGMENT_RE = re.compile(r"^[a-z0-9_]+$")

    def validate(self):
        for service in os.listdir(self.root):
            service_path = os.path.join(self.root, service)
            if not os.path.isdir(service_path):
                self.logger.log(f"Unexpected File: '{service_path}' in {self.root}")
                continue
            self.check_only_directories(service_path)

            for resource in os.listdir(service_path):
                res_path = os.path.join(service_path, resource)
                if not os.path.isdir(res_path):
                    continue

                # Check the vars package    
                self.check_vars_package(service, resource, res_path)

                self.check_only_directories(res_path)
                resource_files = set(os.listdir(res_path))
                required_files = {"policy.rego"} if "vars.rego" in resource_files else self.DEFAULT_REQUIRED

                for policy_name in os.listdir(res_path):
                    folder = os.path.join(res_path, policy_name)
                    if not os.path.isdir(folder):
                        continue

                    files = set(os.listdir(folder))
                    self.check_missing_files(folder, files, required_files)
                    self.check_excess_files(folder, files, required_files)

                    for f in files:
                        if f.endswith(".rego") and not self.VALID_NAME.match(f):
                            self.logger.log(f"Bad filename: '{f}' in {folder}")

                    #Check the policy package
                    self.check_package_for_policy(folder, service, resource, policy_name)




class ErrorLogger:
    def __init__(self):
        self.errors = []

    def log(self, message):
        self.errors.append(message)
        print(f"[ERROR] {message}")

    def summary(self):
        count = len(self.errors)
        if count == 0:
            print("✅ No errors found.")
        else:
            print(f"\n ❌ {count} error(s) found.")
        return count


def main():
    logger = ErrorLogger()
    inputs = InputValidator("inputs/gcp", logger)
    policies = PolicyValidator("policies/gcp", logger)

    print("\n Formatting .tf files...\n")
    print("\n Checking INPUT files...\n")
    inputs.validate()

    print("\n Checking POLICY files...\n")
    policies.validate()

    errors = logger.summary()
    
    

if __name__ == "__main__":
    main()
