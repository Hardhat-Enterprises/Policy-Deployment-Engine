"""
Tests for the Terraform JSON Spec Generator.

This package contains unit tests, property-based tests, and integration tests
for the docgen-v2 module.

Test Organization:
    - test_models.py: Tests for data models (Resource, Argument)
    - test_parser.py: Tests for markdown parsing functions
    - test_integration.py: End-to-end integration tests

Property-Based Tests:
    Property-based tests use Hypothesis to verify universal properties across
    randomly generated inputs. Each test runs a minimum of 100 iterations.
"""
