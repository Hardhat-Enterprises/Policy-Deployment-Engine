"""Root conftest for shared fixtures across all tests."""
import sys
from pathlib import Path

# Add scripts directory to path for all tests
project_root = Path(__file__).parent.parent
scripts_dir = project_root / "scripts"
sys.path.insert(0, str(scripts_dir))
