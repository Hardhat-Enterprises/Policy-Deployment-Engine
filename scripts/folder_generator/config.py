import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Set project root to two levels up from this file (scripts/folder_generator)
PROJECT_ROOT = os.path.abspath(os.path.join(BASE_DIR, "..", ".."))

DOCS_DIR = os.path.join(PROJECT_ROOT, "docs")

CACHE_DIR = os.path.join(BASE_DIR, "cache")  # Holds local (gitignored) user state

CLOUD_CONFIGS = {
    "GCP": {
        "docs_folder": os.path.join(DOCS_DIR, "gcp"),
    },
}

STATE_FILE = os.path.join(CACHE_DIR, "user_state.json")

TEMPLATE_BASE_DIR = os.path.join(PROJECT_ROOT, "templates")
POLICY_BASE_DIR = os.path.join(PROJECT_ROOT, "policies")

# A policy is one self-contained directory: the .tf fixtures sit beside policy.rego.
# config.tf is NOT here — there is one shared copy at policies/<platform>/config.tf.
TEMPLATE_FILES_TF = ["compliant.tf", "nonCompliant.tf"]
TEMPLATE_POLICY = "policy.rego"
TEMPLATE_VARS = "_vars.rego"
