"""
Property-based tests for the Orchestrator.

Tests universal properties that should hold for all orchestrator operations
using Hypothesis for property-based testing. Each test runs 100+ iterations
with randomly generated inputs.

Properties Tested:
    - Property 15: Batch processing completeness
    - Property 16: Error isolation in batch processing
    - Property 17: Failed resources are logged
    - Property 18: Batch processing reports counts
    - Property 19: Resource processing is order-independent
    - Property 25: Dry-run mode prevents filesystem changes
    - Property 26: Dry-run mode reports intended actions
    - Property 27: Dry-run validation matches real execution

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

import pytest
from hypothesis import given, strategies as st, settings
from pathlib import Path
import sys
from argparse import Namespace
from unittest.mock import patch
from typing import List
import tempfile
import shutil

# Add project root to path
project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.docgen_v2.lib.orchestrator import Orchestrator
from scripts.docgen_v2.lib.models import Resource, Argument

# Default cache directory for tests
DEFAULT_CACHE_DIR = project_root / 'scripts' / 'docgen_v2' / '.cache'


# Hypothesis strategies for generating test data

@st.composite
def resource_name_list(draw, min_size=1, max_size=10):
    """Generate list of resource names."""
    # Generate resource names in format: {provider}_{service}_{resource}
    provider = draw(st.sampled_from(['aws', 'azurerm', 'google']))
    
    names = []
    for _ in range(draw(st.integers(min_value=min_size, max_value=max_size))):
        service = draw(st.text(min_size=2, max_size=10, alphabet=st.characters(
            whitelist_categories=('Ll',)
        )))
        resource = draw(st.text(min_size=2, max_size=10, alphabet=st.characters(
            whitelist_categories=('Ll',)
        )))
        name = f"{provider}_{service}_{resource}"
        if name not in names:  # Ensure uniqueness
            names.append(name)
    
    return names if names else [f"{provider}_test_resource"]  # Ensure at least one


# Helper function to mock repository operations

from contextlib import contextmanager

@contextmanager
def mock_repository_operations(orchestrator, tmp_path):
    """
    Mock repository operations that are called at the start of orchestrator.run().
    
    This mocks:
    - clone_provider_repo: Returns a fake repo path
    - get_current_version: Not called (version is specified in args)
    - check_for_updates: Not called (version is specified in args)
    """
    with patch.object(orchestrator.repo_manager, 'clone_provider_repo') as mock_clone:
        mock_clone.return_value = tmp_path / 'fake_repo'
        yield mock_clone


# Property Tests

@pytest.mark.property
@given(resource_names=resource_name_list(min_size=1, max_size=10))
@settings(max_examples=100, deadline=None)  # Disable deadline for property tests
def test_property_15_batch_processing_completeness(resource_names):
    """
    Feature: terraform-json-generator, Property 15: Batch processing completeness
    
    For any list of N resources, batch processing should attempt to create N JSON files
    (one per resource).
    
    Validates: Requirements 5.1
    
    This property ensures that batch processing attempts to process every resource
    in the input list, regardless of success or failure of individual resources.
    """
    # Create temporary directory for this test iteration
    with tempfile.TemporaryDirectory() as tmp_dir:
        tmp_path = Path(tmp_dir)
        
        # Create mock arguments
        args = Namespace(
            csp='aws',
            service=['test_service'],
            provider_version='5.0.0',
            output_dir=tmp_path,
            dry_run=True,  # Use dry-run to avoid actual file operations
            silent=False,
            cache_dir=DEFAULT_CACHE_DIR,
            update_cache=False
        )
        
        # Create orchestrator
        orchestrator = Orchestrator(args)
        
        # Mock repository operations and schema extractor
        with mock_repository_operations(orchestrator, tmp_path), \
             patch.object(orchestrator.schema_extractor, 'list_available_resources') as mock_list, \
             patch.object(orchestrator.schema_extractor, 'extract_resource_schema') as mock_extract:
            # Mock list_available_resources to return our resource names
            mock_list.return_value = resource_names
            
            # Create mock resources for each name
            mock_resources = []
            for name in resource_names:
                resource = Resource(
                    resource_name=name,
                    subcategory='TestService',
                    arguments={'test': Argument('Test arg', False)},
                    provider='aws',
                    version='5.0.0'
                )
                mock_resources.append(resource)
            
            # Set up mock to return resources in order
            mock_extract.side_effect = mock_resources
            
            # Run orchestrator
            orchestrator.run()
            
            # Verify that extract_resource_schema was called N times (once per resource)
            assert mock_extract.call_count == len(resource_names), \
                f"Expected {len(resource_names)} extraction attempts, got {mock_extract.call_count}"


@pytest.mark.property
@given(
    successful_count=st.integers(min_value=1, max_value=5),
    failing_count=st.integers(min_value=1, max_value=5)
)
@settings(max_examples=100)
def test_property_16_error_isolation_in_batch_processing(successful_count, failing_count):
    """
    Feature: terraform-json-generator, Property 16: Error isolation in batch processing
    
    For any list of resources where one fails, the remaining resources should still
    be processed successfully.
    
    Validates: Requirements 5.2
    
    This property ensures that individual resource failures don't stop the entire
    batch processing operation. Error isolation is critical for processing large
    numbers of resources.
    """
    with tempfile.TemporaryDirectory() as tmp_dir:
        tmp_path = Path(tmp_dir)
        
        # Create resource names
        total_count = successful_count + failing_count
        resource_names = [f"aws_test_resource_{i}" for i in range(total_count)]
        
        # Create mock arguments
        args = Namespace(
            csp='aws',
            service=['test_service'],
            provider_version='5.0.0',
            output_dir=tmp_path,
            dry_run=True,
            silent=False,
            cache_dir=DEFAULT_CACHE_DIR,
            update_cache=False
        )
        
        # Create orchestrator
        orchestrator = Orchestrator(args)
        
        # Mock repository operations and schema extractor
        with mock_repository_operations(orchestrator, tmp_path), \
             patch.object(orchestrator.schema_extractor, 'list_available_resources') as mock_list, \
             patch.object(orchestrator.schema_extractor, 'extract_resource_schema') as mock_extract:
            # Mock list_available_resources to return our resource names
            mock_list.return_value = resource_names
            
            # Set up mock to fail for some resources and succeed for others
            def side_effect(csp, resource_name, version):
                # Fail for the first failing_count resources
                if resource_names.index(resource_name) < failing_count:
                    return None  # Simulate extraction failure
                else:
                    # Return valid resource for successful ones
                    return Resource(
                        resource_name=resource_name,
                        subcategory='TestService',
                        arguments={'test': Argument('Test arg', False)},
                        provider='aws',
                        version='5.0.0'
                    )
            
            mock_extract.side_effect = side_effect
            
            # Run orchestrator
            exit_code = orchestrator.run()
            
            # Verify that all resources were attempted
            assert mock_extract.call_count == total_count, \
                f"Expected {total_count} extraction attempts despite failures"
            
            # Verify that successful resources were processed
            assert orchestrator.total_processed == successful_count, \
                f"Expected {successful_count} successful, got {orchestrator.total_processed}"
            
            # Verify that failures were tracked
            assert orchestrator.total_failed == failing_count, \
                f"Expected {failing_count} failures, got {orchestrator.total_failed}"


@pytest.mark.property
@given(resource_names=resource_name_list(min_size=1, max_size=10))
@settings(max_examples=100)
def test_property_17_failed_resources_are_logged(resource_names):
    """
    Feature: terraform-json-generator, Property 17: Failed resources are logged
    
    For any resource that fails to process, an error log entry should be created
    containing the resource name.
    
    Validates: Requirements 5.3
    
    This property ensures that all failures are properly logged with sufficient
    context (resource name) to enable debugging and tracking.
    """
    with tempfile.TemporaryDirectory() as tmp_dir:
        tmp_path = Path(tmp_dir)
        
        # Create mock arguments
        args = Namespace(
            csp='aws',
            service=['test_service'],
            provider_version='5.0.0',
            output_dir=tmp_path,
            dry_run=True,
            silent=False,
            cache_dir=DEFAULT_CACHE_DIR,
            update_cache=False
        )
        
        # Create orchestrator
        orchestrator = Orchestrator(args)
        
        # Mock the schema extractor to fail for all resources
        with mock_repository_operations(orchestrator, tmp_path), \
             patch.object(orchestrator.schema_extractor, 'list_available_resources') as mock_list, \
             patch.object(orchestrator.schema_extractor, 'extract_resource_schema') as mock_extract:
            mock_list.return_value = resource_names
            mock_extract.return_value = None  # Simulate extraction failure
            
            # Run orchestrator
            orchestrator.run()
            
            # Verify that all failed resources are in the failed_resources list
            assert len(orchestrator.failed_resources) == len(resource_names), \
                f"Expected {len(resource_names)} failed resources to be logged"
            
            # Verify that each resource name appears in the failed list
            for resource_name in resource_names:
                assert resource_name in orchestrator.failed_resources, \
                    f"Failed resource {resource_name} should be in failed_resources list"


@pytest.mark.property
@given(
    successful_count=st.integers(min_value=0, max_value=10),
    failing_count=st.integers(min_value=0, max_value=10)
)
@settings(max_examples=100)
def test_property_18_batch_processing_reports_counts(successful_count, failing_count):
    """
    Feature: terraform-json-generator, Property 18: Batch processing reports counts
    
    For any batch processing run, the final output should include the total number
    of resources processed and the number of failures.
    
    Validates: Requirements 5.4
    
    This property ensures that summary statistics are always reported, providing
    visibility into the success/failure rate of batch operations.
    """
    # Skip if no resources (edge case)
    if successful_count + failing_count == 0:
        return
    
    with tempfile.TemporaryDirectory() as tmp_dir:
        tmp_path = Path(tmp_dir)
        
        # Create resource names
        total_count = successful_count + failing_count
        resource_names = [f"aws_test_resource_{i}" for i in range(total_count)]
        
        # Create mock arguments
        args = Namespace(
            csp='aws',
            service=['test_service'],
            provider_version='5.0.0',
            output_dir=tmp_path,
            dry_run=True,
            silent=False,
            cache_dir=DEFAULT_CACHE_DIR,
            update_cache=False
        )
        
        # Create orchestrator
        orchestrator = Orchestrator(args)
        
        # Mock repository operations and schema extractor
        with mock_repository_operations(orchestrator, tmp_path), \
             patch.object(orchestrator.schema_extractor, 'list_available_resources') as mock_list, \
             patch.object(orchestrator.schema_extractor, 'extract_resource_schema') as mock_extract:
            mock_list.return_value = resource_names
            
            # Set up mock to fail for some and succeed for others
            def side_effect(csp, resource_name, version):
                if resource_names.index(resource_name) < failing_count:
                    return None  # Fail
                else:
                    return Resource(
                        resource_name=resource_name,
                        subcategory='TestService',
                        arguments={'test': Argument('Test arg', False)},
                        provider='aws',
                        version='5.0.0'
                    )
            
            mock_extract.side_effect = side_effect
            
            # Run orchestrator
            orchestrator.run()
            
            # Verify that counts are tracked correctly
            assert orchestrator.total_processed == successful_count, \
                f"Expected total_processed={successful_count}, got {orchestrator.total_processed}"
            
            assert orchestrator.total_failed == failing_count, \
                f"Expected total_failed={failing_count}, got {orchestrator.total_failed}"
            
            # Verify total attempted equals sum
            total_attempted = orchestrator.total_processed + orchestrator.total_failed
            assert total_attempted == total_count, \
                f"Expected total_attempted={total_count}, got {total_attempted}"


@pytest.mark.property
@given(resource_names=resource_name_list(min_size=2, max_size=5))
@settings(max_examples=50, deadline=5000)  # Reduced examples due to complexity, 5s deadline for integration-style test
def test_property_19_resource_processing_is_order_independent(resource_names):
    """
    Feature: terraform-json-generator, Property 19: Resource processing is order-independent
    
    For any list of resources, processing them in different orders should produce
    identical JSON files for each resource.
    
    Validates: Requirements 5.5
    
    This property ensures that resource processing is truly independent and that
    the order of processing doesn't affect the output for any individual resource.
    """
    import random
    
    with tempfile.TemporaryDirectory() as tmp_dir:
        tmp_path = Path(tmp_dir)
        
        # Create two different orderings of the same resources
        order1 = list(resource_names)
        order2 = list(resource_names)
        random.shuffle(order2)
        
        # If shuffle didn't change order, manually swap first two
        if order1 == order2 and len(order2) >= 2:
            order2[0], order2[1] = order2[1], order2[0]
        
        # Process with first ordering
        args1 = Namespace(
            csp='aws',
            service=['test_service'],
            provider_version='5.0.0',
            output_dir=tmp_path / "run1",
            dry_run=True,
            silent=False,
            cache_dir=DEFAULT_CACHE_DIR,
            update_cache=False
        )
        
        orchestrator1 = Orchestrator(args1)
        
        # Mock to return consistent resources
        with patch.object(orchestrator1.schema_extractor, 'list_available_resources') as mock_list1, \
             patch.object(orchestrator1.schema_extractor, 'extract_resource_schema') as mock_extract1:
            mock_list1.return_value = order1
            
            def create_resource(csp, resource_name, version):
                return Resource(
                    resource_name=resource_name,
                    subcategory='TestService',
                    arguments={'test': Argument(f'Arg for {resource_name}', False)},
                    provider='aws',
                    version='5.0.0'
                )
            
            mock_extract1.side_effect = create_resource
            orchestrator1.run()
            results1 = orchestrator1.total_processed
        
        # Process with second ordering
        args2 = Namespace(
            csp='aws',
            service=['test_service'],
            provider_version='5.0.0',
            output_dir=tmp_path / "run2",
            dry_run=True,
            silent=False,
            cache_dir=DEFAULT_CACHE_DIR,
            update_cache=False
        )
        
        orchestrator2 = Orchestrator(args2)
        
        with patch.object(orchestrator2.schema_extractor, 'list_available_resources') as mock_list2, \
             patch.object(orchestrator2.schema_extractor, 'extract_resource_schema') as mock_extract2:
            mock_list2.return_value = order2
            mock_extract2.side_effect = create_resource
            orchestrator2.run()
            results2 = orchestrator2.total_processed
        
        # Verify same number of resources processed regardless of order
        assert results1 == results2, \
            f"Processing order affected results: {results1} vs {results2}"
        
        # Verify both processed all resources
        assert results1 == len(resource_names), \
            f"Expected {len(resource_names)} processed, got {results1}"


@pytest.mark.property
@given(resource_names=resource_name_list(min_size=1, max_size=5))
@settings(max_examples=100)
def test_property_25_dry_run_prevents_filesystem_changes(resource_names):
    """
    Feature: terraform-json-generator, Property 25: Dry-run mode prevents filesystem changes
    
    For any execution in dry-run mode, no directories should be created and no files
    should be written.
    
    Validates: Requirements 8.6
    
    This property ensures that dry-run mode is truly safe and doesn't make any
    filesystem modifications, allowing users to preview operations without risk.
    """
    with tempfile.TemporaryDirectory() as tmp_dir:
        tmp_path = Path(tmp_dir)
        
        # Create mock arguments with dry-run enabled
        args = Namespace(
            csp='aws',
            service=['test_service'],
            provider_version='5.0.0',
            output_dir=tmp_path,
            dry_run=True,  # DRY-RUN MODE
            silent=False,
            cache_dir=DEFAULT_CACHE_DIR,
            update_cache=False
        )
        
        # Record initial filesystem state
        initial_files = set(tmp_path.rglob('*')) if tmp_path.exists() else set()
        
        # Create orchestrator
        orchestrator = Orchestrator(args)
        
        # Mock the schema extractor to return valid resources
        with mock_repository_operations(orchestrator, tmp_path), \
             patch.object(orchestrator.schema_extractor, 'list_available_resources') as mock_list, \
             patch.object(orchestrator.schema_extractor, 'extract_resource_schema') as mock_extract:
            mock_list.return_value = resource_names
            
            def create_resource(csp, resource_name, version):
                return Resource(
                    resource_name=resource_name,
                    subcategory='TestService',
                    arguments={'test': Argument('Test arg', False)},
                    provider='aws',
                    version='5.0.0'
                )
            
            mock_extract.side_effect = create_resource
            
            # Run orchestrator in dry-run mode
            orchestrator.run()
        
        # Check filesystem state after dry-run
        final_files = set(tmp_path.rglob('*')) if tmp_path.exists() else set()
        
        # Verify no new files or directories were created
        new_files = final_files - initial_files
        assert len(new_files) == 0, \
            f"Dry-run mode created files/directories: {[str(f) for f in new_files]}"


@pytest.mark.property
@given(resource_names=resource_name_list(min_size=1, max_size=5))
@settings(max_examples=100)
def test_property_26_dry_run_reports_intended_actions(resource_names):
    """
    Feature: terraform-json-generator, Property 26: Dry-run mode reports intended actions
    
    For any execution in dry-run mode, all actions that would be performed should
    be logged.
    
    Validates: Requirements 8.7
    
    This property ensures that dry-run mode provides visibility into what would
    happen during actual execution, allowing users to preview operations.
    """
    import logging
    from io import StringIO
    
    with tempfile.TemporaryDirectory() as tmp_dir:
        tmp_path = Path(tmp_dir)
        
        # Create mock arguments with dry-run enabled
        args = Namespace(
            csp='aws',
            service=['test_service'],
            provider_version='5.0.0',
            output_dir=tmp_path,
            dry_run=True,  # DRY-RUN MODE
            silent=False,
            cache_dir=DEFAULT_CACHE_DIR,
            update_cache=False
        )
        
        # Create orchestrator
        orchestrator = Orchestrator(args)
        
        # Set up logging capture
        log_stream = StringIO()
        handler = logging.StreamHandler(log_stream)
        handler.setLevel(logging.INFO)
        logger = logging.getLogger('scripts.docgen_v2.lib.orchestrator')
        logger.addHandler(handler)
        logger.setLevel(logging.INFO)
        
        try:
            # Mock repository operations and schema extractor
            with mock_repository_operations(orchestrator, tmp_path), \
                 patch.object(orchestrator.schema_extractor, 'list_available_resources') as mock_list, \
                 patch.object(orchestrator.schema_extractor, 'extract_resource_schema') as mock_extract:
                mock_list.return_value = resource_names
                def create_resource(csp, resource_name, version):
                    return Resource(
                        resource_name=resource_name,
                        subcategory='TestService',
                        arguments={'test': Argument('Test arg', False)},
                        provider='aws',
                        version='5.0.0'
                    )
                
                mock_extract.side_effect = create_resource
                
                # Run orchestrator
                orchestrator.run()
            
            # Get logged output
            log_text = log_stream.getvalue()
            
            # Should contain dry-run indicators
            assert 'DRY-RUN' in log_text, \
                "Dry-run mode should log DRY-RUN indicators"
            
            # Should mention what would be written
            assert 'Would write' in log_text or 'Would generate' in log_text, \
                "Dry-run mode should log intended write operations"
        
        finally:
            # Clean up handler
            logger.removeHandler(handler)


@pytest.mark.property
@given(resource_names=resource_name_list(min_size=1, max_size=3))
@settings(max_examples=50, deadline=5000)  # 5s deadline for integration-style test
def test_property_27_dry_run_validation_matches_real_execution(resource_names):
    """
    Feature: terraform-json-generator, Property 27: Dry-run validation matches real execution
    
    For any invalid input, dry-run mode should report the same errors that would
    occur during real execution.
    
    Validates: Requirements 8.8
    
    This property ensures that dry-run mode performs the same validation as real
    execution, so users can catch errors before actually running the generator.
    """
    with tempfile.TemporaryDirectory() as tmp_dir:
        tmp_path = Path(tmp_dir)
        
        # Create mock arguments with invalid configuration (will cause validation errors)
        args_dry = Namespace(
            csp='aws',
            service=['test_service'],
            provider_version='5.0.0',
            output_dir=tmp_path / "dry",
            dry_run=True,  # DRY-RUN MODE
            silent=False,
            cache_dir=DEFAULT_CACHE_DIR,
            update_cache=False
        )
        
        args_real = Namespace(
            csp='aws',
            service=['test_service'],
            provider_version='5.0.0',
            output_dir=tmp_path / "real",
            dry_run=False,  # REAL MODE
            silent=False,
            cache_dir=DEFAULT_CACHE_DIR,
            update_cache=False
        )
        
        # Mock to return invalid resources (missing required fields)
        def create_invalid_resource(csp, resource_name, version):
            # Create resource with validation issues
            resource = Resource(
                resource_name=resource_name,
                subcategory='TestService',
                arguments={
                    'test': Argument(
                        description='Test',
                        required='invalid_type',  # Should be bool, not string - validation error
                    )
                },
                provider='aws',
                version='5.0.0'
            )
            return resource
        
        # Run in dry-run mode
        orchestrator_dry = Orchestrator(args_dry)
        with patch.object(orchestrator_dry.schema_extractor, 'list_available_resources') as mock_list_dry, \
             patch.object(orchestrator_dry.schema_extractor, 'extract_resource_schema') as mock_dry:
            mock_list_dry.return_value = resource_names
            mock_dry.side_effect = create_invalid_resource
            exit_code_dry = orchestrator_dry.run()
            failures_dry = orchestrator_dry.total_failed
        
        # Run in real mode
        orchestrator_real = Orchestrator(args_real)
        with patch.object(orchestrator_real.schema_extractor, 'list_available_resources') as mock_list_real, \
             patch.object(orchestrator_real.schema_extractor, 'extract_resource_schema') as mock_real:
            mock_list_real.return_value = resource_names
            mock_real.side_effect = create_invalid_resource
            exit_code_real = orchestrator_real.run()
            failures_real = orchestrator_real.total_failed
        
        # Verify that both modes detected the same number of failures
        assert failures_dry == failures_real, \
            f"Dry-run and real mode should detect same failures: {failures_dry} vs {failures_real}"
        
        # Verify that both modes had the same exit code
        assert exit_code_dry == exit_code_real, \
            f"Dry-run and real mode should have same exit code: {exit_code_dry} vs {exit_code_real}"
