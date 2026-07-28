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
INPUT_BASE_DIR = os.path.join(PROJECT_ROOT, "inputs")
POLICY_BASE_DIR = os.path.join(PROJECT_ROOT, "policies")

TEMPLATE_FILES_TF = ["compliant.tf", "config.tf", "nonCompliant.tf"]
TEMPLATE_POLICY = "policy.rego"
TEMPLATE_VARS = "_vars.rego"
