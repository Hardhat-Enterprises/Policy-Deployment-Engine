import os

# Always resolve BASE_DIR to scripts/folder-generator
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Set PROJECT_ROOT to your repo's top directory
PROJECT_ROOT = os.path.abspath(os.path.join(BASE_DIR, "..", ".."))

# Docs directory now points to ../docs from root, as required
DOCS_DIR = os.path.join(PROJECT_ROOT, "docs")

# Cache directory (if needed) inside scripts/folder-generator/cache
CACHE_DIR = os.path.join(BASE_DIR, "cache")

CLOUD_CONFIGS = {
    "GCP": {
        "docs_folder": os.path.join(DOCS_DIR, "gcp"),
        "cache_file": os.path.join(CACHE_DIR, "gcp_service_cache.json"),
    },
    # Uncomment and modify as you add more providers:
    # "Azure": {
    #     "docs_folder": os.path.join(DOCS_DIR, "azure"),
    #     "cache_file": os.path.join(CACHE_DIR, "azure_service_cache.json"),
    # },
}

STATE_FILE = os.path.join(CACHE_DIR, "user_state.json")

# These should be root-level directories, not relative to BASE_DIR
TEMPLATE_BASE_DIR = os.path.join(PROJECT_ROOT, "templates")
INPUT_BASE_DIR = os.path.join(PROJECT_ROOT, "inputs")
POLICY_BASE_DIR = os.path.join(PROJECT_ROOT, "policies")

TEMPLATE_FILES_TF = ["c.tf", "config.tf", "nc.tf"]
TEMPLATE_POLICY = "policy.rego"
TEMPLATE_VARS = "vars.rego"
