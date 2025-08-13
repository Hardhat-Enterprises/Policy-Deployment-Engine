import os
import re

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


class InputValidator(BaseValidator):
    REQUIRED = {"c.tf", "nc.tf", "config.tf", "plan.json", ".terraform.lock.hcl", ".terraform", "plan"}
    VALID_NAME = re.compile(r"^[a-z0-9_]+\.tf$")

    def validate(self):
        for service in os.listdir(self.root):
            service_path = os.path.join(self.root, service)
            if not os.path.isdir(service_path): 
                self.logger.log(f"Unexpected File: '{f}' in {folder}")
                continue

            for resource in os.listdir(service_path):
                res_path = os.path.join(service_path, resource)
                if not os.path.isdir(res_path): 
                   # self.logger.log(f"Unexpected File: '{res_path}' in {folder}")
                    continue
                    

                for policy_name in os.listdir(res_path):
                    folder = os.path.join(res_path, policy_name)
                    if not os.path.isdir(folder): continue

                    files = set(os.listdir(folder))
                    self.check_missing_files(folder, files, self.REQUIRED)
                    self.check_excess_files(folder, files, self.REQUIRED)

                    for f in files:
                        if f.endswith(".tf") and not self.VALID_NAME.match(f):
                            self.logger.log(f"Bad filename: '{f}' in {folder}")

class PolicyValidator(BaseValidator):
    DEFAULT_REQUIRED = {"policy.rego", "vars.rego"}
    VALID_NAME = re.compile(r"^[a-z0-9_]+\.rego$")

    def validate(self):
        for service in os.listdir(self.root):
            service_path = os.path.join(self.root, service)
            if not os.path.isdir(service_path):
                self.logger.log(f"Unexpected File: '{f}' in {folder}")
                continue

            for resource in os.listdir(service_path):
                res_path = os.path.join(service_path, resource)
                if not os.path.isdir(res_path):
                    continue

                # Check if vars.rego is directly under the resource folder
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



class ErrorLogger:
    def __init__(self):
        self.errors = []

    def log(self, message):
        self.errors.append(message)
        print(f"[ERROR] {message}")

    def summary(self):
        count = len(self.errors)
        if count == 0:
            print(" No errors found.")
        else:
            print(f"\n {count} error(s) found.")
        return count


def main():
    logger = ErrorLogger()
    inputs = InputValidator("inputs/gcp", logger)
    policies = PolicyValidator("policies/gcp", logger)

    print("\n Checking INPUT files...\n")
    inputs.validate()

    print("\n Checking POLICY files...\n")
    policies.validate()

    errors = logger.summary()
    
    

if __name__ == "__main__":
    main()
