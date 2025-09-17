import os
import re
import sys
import shutil
import subprocess
import argparse



# Error logging

class ErrorLogger:
    def __init__(self):
        self.errors = []

    def log(self, message):
        self.errors.append(message)
        print(f"[ERROR] {message}")

    def summary(self):
        n = len(self.errors)
        print("✅ No errors found." if n == 0 else f"\n❌ {n} error(s) found.")
        return n



# Base validator (shared helpers)

class BaseValidator:
    # junk/system files + project-level ignores
    IGNORE_FILES = {".DS_Store", "Thumbs.db", "desktop.ini", "helpers.rego","plan","plan.json",".terraform.lock.hcl",".terraform"}
    PKG_RE = re.compile(r"^\s*package\s+([A-Za-z0-9_.]+)")
    SEGMENT_RE = re.compile(r"^[a-z0-9_]+$")
    RVN_RE = re.compile(r'"resource_value_name"\s*:\s*"([^"]+)"')  # from vars.rego

    def __init__(self, root, logger):
        self.root = root
        self.logger = logger
        

    # small utilities
    def list_filtered(self, path):
        """os.listdir() minus junk/ignored and Apple '._' files."""
        try:
            return [i for i in os.listdir(path) if i not in self.IGNORE_FILES and not i.startswith("._")]
        except FileNotFoundError:
            self.logger.log(f"Folder not found: {path}")
            return []

    def split_items(self, folder, items):
        files, dirs = set(), set()
        for i in items:
            p = os.path.join(folder, i)
            (files if os.path.isfile(p) else dirs).add(i)
        return files, dirs

    def enforce_required_and_excess(self, folder, files, required_files):
        self.check_missing_files(folder, files, required_files)
        self.check_excess_files(folder, files, required_files)

    # ---------- file presence ----------
    def check_missing_files(self, folder, actual_files, required_files):
        missing = required_files - actual_files
        if missing:
            self.logger.log(f"Missing files in {folder}: {sorted(missing)}")

    def check_excess_files(self, folder, actual_files, required_files):
        excess = actual_files - required_files
        if excess:
            self.logger.log(f"Excess files in {folder}: {sorted(excess)}")

    # ---------- structure ----------
    def check_only_directories(self, folder, allowed_files=()):
        """Only directories allowed at this level; explicitly allow a few files if needed."""
        for item in self.list_filtered(folder):
            p = os.path.join(folder, item)
            if os.path.isfile(p) and item not in allowed_files:
                allow_txt = f" and {', '.join(allowed_files)}" if allowed_files else ""
                self.logger.log(
                    f"Unexpected file '{item}' in {folder}. Only directories{allow_txt} are allowed."
                )

    # ---------- terraform helpers ----------
    def run_terraform_fmt(self, cwd):
        if shutil.which("terraform") is None:
            print(f"[info] terraform not found in PATH; skipping fmt in {cwd}")
            return
        try:
            subprocess.run(["terraform", "fmt", "-recursive"], cwd=cwd, check=True)
        except subprocess.CalledProcessError as e:
            self.logger.log(f"terraform fmt failed in {cwd}: {e}")

    # ---------- rego helpers ----------
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

    def _expected_pkg(self, service, resource, policy_name):
        return f"terraform.gcp.security.{service}.{resource}.{policy_name}"

    def check_package_for_policy(self, folder, service, resource, policy_name):
        for seg, label in ((service, "service"), (resource, "resource"), (policy_name, "policy folder")):
            if not self.SEGMENT_RE.fullmatch(seg):
                self.logger.log(f"Invalid {label} segment '{seg}' in {folder}")

        policy_path = os.path.join(folder, "policy.rego")
        expected = self._expected_pkg(service, resource, policy_name)
        actual = self._read_package(policy_path)

        if actual is None:
            self.logger.log(f"No package declaration found in {policy_path}")
        elif actual != expected:
            self.logger.log(f"Bad package name in {policy_path}. Expected '{expected}', found '{actual}'")

    def check_vars_package(self, service, resource, res_path):
        vars_path = os.path.join(res_path, "vars.rego")
        if not os.path.exists(vars_path):
            return
        expected = f"terraform.gcp.security.{service}.{resource}.vars"
        actual = self._read_package(vars_path)
        if actual is None:
            self.logger.log(f"No package declaration found in {vars_path}")
        elif actual != expected:
            self.logger.log(f"Bad package name in {vars_path}. Expected '{expected}', found '{actual}'")

    def read_resource_value_name(self, policies_root, service, resource):
        """Read resource_value_name (e.g., 'name') from policies/<service>/<resource>/vars.rego."""
        vars_path = os.path.join(policies_root, service, resource, "vars.rego")
        try:
            with open(vars_path, "r", encoding="utf-8") as fh:
                text = fh.read()
            m = self.RVN_RE.search(text)
            return m.group(1) if m else "name"
        except FileNotFoundError:
            return "name"

    # ---------- terraform content checks ----------
    def validate_resource_type_matches_dir(self, tf_path, expected_type):
        try:
            with open(tf_path, "r", encoding="utf-8") as fh:
                for line in fh:
                    s = line.strip()
                    if s.startswith("resource "):
                        parts = s.split()
                        if len(parts) >= 3 and parts[1].strip('"') != expected_type:
                            self.logger.log(
                                f"Resource type '{parts[1].strip('\"')}' in {tf_path} "
                                f"does not match directory '{expected_type}'"
                            )
        except OSError as e:
            self.logger.log(f"Could not read {tf_path}: {e}")

    def validate_resource_name_sequence(self, tf_path, prefix):
        """
        Allow either plain 'c'/'nc' OR sequential names like c1, c2... / nc1, nc2...
        """
        names = []
        try:
            with open(tf_path, "r", encoding="utf-8") as fh:
                for line in fh:
                    s = line.strip()
                    if s.startswith("resource "):
                        parts = s.split()
                        if len(parts) >= 3:
                            names.append(parts[2].strip('"'))

            for i, name in enumerate(names, start=1):
                expected = f"{prefix}{i}"
                if name not in {prefix, expected}:
                    self.logger.log(
                        f"Unexpected resource name '{name}' in {tf_path}; "
                        f"expected '{expected}' or '{prefix}'"
                    )
        except OSError as e:
            self.logger.log(f"Could not read {tf_path}: {e}")


    def validate_resource_value_names(self, tf_path, value_key, prefix):
        """
        Allow resource value name to be either the logical resource name (c1, nc1, etc.)
        or just the base prefix ('c' or 'nc').
        """
        try:
            with open(tf_path, "r", encoding="utf-8") as fh:
                current = None
                seen = None
                for raw in fh:
                    line = raw.strip()

                    if line.startswith("resource "):
                        # check previous block
                        if current and seen and seen not in {current, prefix}:
                            self.logger.log(
                                f"Wrong {value_key}='{seen}' in {tf_path}; "
                                f"expected '{current}' or '{prefix}'"
                            )
                        parts = line.split()
                        current = parts[2].strip('"') if len(parts) >= 3 else None
                        seen = None
                        continue

                    if current and line.startswith(value_key) and "=" in line:
                        val = line.split("=", 1)[1].strip()
                        if val.startswith('"') and '"' in val[1:]:
                            seen = val.strip('"')

                # flush last block
                if current and seen and seen not in {current, prefix}:
                    self.logger.log(
                        f"Wrong {value_key}='{seen}' in {tf_path}; "
                        f"expected '{current}' or '{prefix}'"
                    )
        except OSError as e:
            self.logger.log(f"Could not read {tf_path}: {e}")




# Input validator (Terraform side)

class InputValidator(BaseValidator):
    REQUIRED = {"c.tf", "nc.tf", "config.tf"}
    VALID_NAME = re.compile(r"^[a-z0-9_]+\.tf$")

    def __init__(self, root, logger, policies_root="policies/gcp"):
        super().__init__(root, logger)
        self.policies_root = policies_root  # to read vars.rego

    # public API
    def validate(self):
        """Validate all services under inputs/gcp."""
        for service in self.list_filtered(self.root):
            svc_path = os.path.join(self.root, service)
            if os.path.isdir(svc_path):
                self._validate_service_path(service, svc_path)
            else:
                self.logger.log(f"Unexpected file at inputs service level: {svc_path}")

    def validate_service(self, service):
        """Validate a single service under inputs/gcp/<service>."""
        svc_path = os.path.join(self.root, service)
        if not os.path.isdir(svc_path):
            self.logger.log(f"Inputs service not found: {svc_path}")
            return
        self._validate_service_path(service, svc_path)

    # internal shared logic
    def _validate_service_path(self, service, service_path):
        # format all .tf within this service subtree
        self.run_terraform_fmt(service_path)
        # only directories at service level
        self.check_only_directories(service_path, allowed_files=())

        # level: inputs/gcp/<service>/<resource>
        for resource in self.list_filtered(service_path):
            res_path = os.path.join(service_path, resource)
            if not os.path.isdir(res_path):
                self.logger.log(f"Unexpected file at inputs resource level: {res_path}")
                continue
            self.check_only_directories(res_path, allowed_files=())

            # attribute key from policies/<service>/<resource>/vars.rego
            value_key = self.read_resource_value_name(self.policies_root, service, resource)

            # level: inputs/gcp/<service>/<resource>/<policy_name>
            for policy_name in self.list_filtered(res_path):
                folder = os.path.join(res_path, policy_name)
                if not os.path.isdir(folder):
                    self.logger.log(f"Unexpected file at inputs policy level: {folder}")
                    continue

                items = self.list_filtered(folder)
                files, dirs = self.split_items(folder, items)

                self.enforce_required_and_excess(folder, files, self.REQUIRED)

                unexpected_dirs = dirs - {".terraform", "plan"}
                if unexpected_dirs:
                    self.logger.log(f"Unexpected directories in {folder}: {sorted(unexpected_dirs)}")

                for name in files:
                    if name.endswith(".tf") and not self.VALID_NAME.match(name):
                        self.logger.log(f"Bad filename: '{name}' in {folder}")

                expected_type = os.path.basename(res_path)
                for tf_name, prefix in (("c.tf", "c"), ("nc.tf", "nc")):
                    tf_path = os.path.join(folder, tf_name)
                    if os.path.isfile(tf_path):
                        self.validate_resource_type_matches_dir(tf_path, expected_type)
                        self.validate_resource_name_sequence(tf_path, prefix)
                        self.validate_resource_value_names(tf_path, value_key, prefix)



# Policy validator (Rego side)

class PolicyValidator(BaseValidator):
    DEFAULT_REQUIRED = {"policy.rego", "vars.rego"}
    VALID_NAME = re.compile(r"^[a-z0-9_]+\.rego$")


    def validate(self):
        """Validate all services under policies/gcp."""
        for service in self.list_filtered(self.root):
            svc_path = os.path.join(self.root, service)
            if os.path.isdir(svc_path):
                self._validate_service_path(service, svc_path)
            else:
                self.logger.log(f"Unexpected file at policies service level: {svc_path}")

    def validate_service(self, service):
        """Validate a single service under policies/gcp/<service>."""
        svc_path = os.path.join(self.root, service)
        if not os.path.isdir(svc_path):
            self.logger.log(f"Policies service not found: {svc_path}")
            return
        self._validate_service_path(service, svc_path)

    # internal shared logic
    def _validate_service_path(self, service, service_path):
        self.check_only_directories(service_path, allowed_files=("helpers.rego",))

        # level: policies/gcp/<service>/<resource>
        for resource in self.list_filtered(service_path):
            res_path = os.path.join(service_path, resource)
            if not os.path.isdir(res_path):
                self.logger.log(f"Unexpected file at policies resource level: {res_path}")
                continue

            self.check_only_directories(res_path, allowed_files=("vars.rego", "helpers.rego"))

            resource_items = set(self.list_filtered(res_path))
            required_files = {"policy.rego"} if "vars.rego" in resource_items else self.DEFAULT_REQUIRED

            # level: policies/gcp/<service>/<resource>/<policy_name>
            for policy_name in self.list_filtered(res_path):
                folder = os.path.join(res_path, policy_name)
                if not os.path.isdir(folder):
                    continue  # skip allowed files in resource root

                items = self.list_filtered(folder)
                files, dirs = self.split_items(folder, items)

                if dirs:
                    self.logger.log(f"Unexpected directories in {folder}: {sorted(dirs)}")

                self.enforce_required_and_excess(folder, files, required_files)

                for name in files:
                    if name.endswith(".rego") and not self.VALID_NAME.match(name):
                        self.logger.log(f"Bad filename: '{name}' in {folder}")

                self.check_package_for_policy(folder, service, resource, policy_name)


def main():
    parser = argparse.ArgumentParser(description="Run GCP linters for Terraform inputs and OPA policies.")
    parser.add_argument(
        "--gcp",
        metavar="SERVICE",
        help="Lint only the given GCP service (e.g. --gcp google_kms). If not provided, all services are linted."
    )
    args = parser.parse_args()

    logger = ErrorLogger()

    # Require being CALLED from the Policy-Deployment-Engine root
    repo_root = os.getcwd()
    if not (os.path.isdir(os.path.join(repo_root, "inputs")) and
            os.path.isdir(os.path.join(repo_root, "policies"))):
        print("[ERROR] Please run this script from the Policy-Deployment-Engine directory "
              "(the folder that contains 'inputs/' and 'policies/').")
        sys.exit(2)

    # Build paths relative to where the command is executed
    inputs_root   = os.path.join(repo_root, "inputs", "gcp")
    policies_root = os.path.join(repo_root, "policies", "gcp")

    inputs = InputValidator(inputs_root, logger, policies_root=policies_root)
    policies = PolicyValidator(policies_root, logger)

    if args.gcp:
        print(f"\n🔍 Linting only service: {args.gcp}\n")
        print("\n🔍 Checking INPUTS folder \n")
        inputs.validate_service(args.gcp)
        print("\n🔍 Checking POLICIES folder \n")
        policies.validate_service(args.gcp)
    else:
        print("\n🔍 Linting all GCP services...\n")
        print("\n🔍 Checking INPUTS folder \n")
        inputs.validate()
        print("\n🔍 Checking POLICIES folder \n")
        policies.validate()

    if logger.summary():
        sys.exit(1)



if __name__ == "__main__":
    main()