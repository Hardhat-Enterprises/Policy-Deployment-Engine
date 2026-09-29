"""Make the version-aware tool importable when pytest collects these tests

The repo configures pytest with --import-mode=importlib (see pyproject.toml).
That mode does not add a test file's own directory to sys.path, so the flat,
top-level imports these modules use for each other and in the tests
(e.g. `from schema_differ import load_schema`) would not resolve under pytest.

The tool is a self-contained flat directory that also runs standalone
(`python test_differ.py`). To keep that working *and* let pytest find the
modules, so add this folder to sys.path here, before test collection.
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
