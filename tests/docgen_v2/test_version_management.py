"""
Tests for version management functionality.

Tests version auto-detection, update checking, and cache updates in the
RepositoryManager and Orchestrator.

Test Categories:
    - Version Auto-Detection (get_current_version)
    - Update Checking (check_for_updates)
    - Cache Updates (update_cache)
    - Orchestrator Integration
"""

import subprocess
import sys
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock, call
import pytest
from argparse import Namespace

# Add project root to path
project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.docgen_v2.lib.repository_manager import RepositoryManager
from scripts.docgen_v2.lib.orchestrator import Orchestrator
from scripts.docgen_v2.lib.errors import ConnectionError


# ============================================================================
# Test 1: Version Auto-Detection (get_current_version)
# ============================================================================

class TestGetCurrentVersion:
    """Tests for get_current_version() method."""
    
    def test_version_detection_on_specific_tag(self, tmp_path):
        """Test 1a: Version detection when on a specific tag."""
        repo_mgr = RepositoryManager()
        repo_path = tmp_path / "test_repo"
        
        # Mock git commands
        with patch('subprocess.run') as mock_run:
            # Mock fetch tags (succeeds)
            # Mock describe --exact-match (succeeds - we're on a tag)
            mock_run.side_effect = [
                Mock(returncode=0, stdout="", stderr=""),  # fetch tags
                Mock(returncode=0, stdout="v6.14.0\n", stderr="")  # describe exact
            ]
            
            version = repo_mgr.get_current_version(repo_path)
            
            assert version == "v6.14.0"
            assert mock_run.call_count == 2
    
    def test_version_detection_on_main_branch(self, tmp_path):
        """Test 1b: Version detection when on main branch (not on tag)."""
        repo_mgr = RepositoryManager()
        repo_path = tmp_path / "test_repo"
        
        # Mock git commands
        with patch('subprocess.run') as mock_run:
            # Mock fetch tags (succeeds)
            # Mock describe --exact-match (fails - not on a tag)
            # Mock describe --tags --abbrev=0 (succeeds - get latest tag)
            mock_run.side_effect = [
                Mock(returncode=0, stdout="", stderr=""),  # fetch tags
                Mock(returncode=1, stdout="", stderr="not on tag"),  # describe exact (fails)
                Mock(returncode=0, stdout="v6.14.0\n", stderr="")  # describe latest
            ]
            
            version = repo_mgr.get_current_version(repo_path)
            
            assert version == "v6.14.0"
            assert mock_run.call_count == 3
    
    def test_version_detection_no_tags(self, tmp_path):
        """Test 1c: Version detection when no tags exist (returns 'unknown')."""
        repo_mgr = RepositoryManager()
        repo_path = tmp_path / "test_repo"
        
        # Mock git commands - all fail
        with patch('subprocess.run') as mock_run:
            mock_run.side_effect = [
                Mock(returncode=0, stdout="", stderr=""),  # fetch tags
                Mock(returncode=1, stdout="", stderr="not on tag"),  # describe exact (fails)
                Mock(returncode=1, stdout="", stderr="no tags"),  # describe latest (fails)
                Mock(returncode=0, stdout="\n", stderr="")  # tag list (empty)
            ]
            
            version = repo_mgr.get_current_version(repo_path)
            
            assert version == "unknown"
    
    def test_version_detection_handles_git_failure(self, tmp_path):
        """Test 1d: Version detection handles git command failures gracefully."""
        repo_mgr = RepositoryManager()
        repo_path = tmp_path / "test_repo"
        
        # Mock git commands - fetch fails
        with patch('subprocess.run') as mock_run:
            mock_run.side_effect = subprocess.CalledProcessError(
                1, ['git', 'fetch'], stderr="network error"
            )
            
            version = repo_mgr.get_current_version(repo_path)
            
            assert version == "unknown"
    
    def test_version_detection_uses_most_recent_tag(self, tmp_path):
        """Test version detection falls back to most recent tag."""
        repo_mgr = RepositoryManager()
        repo_path = tmp_path / "test_repo"
        
        # Mock git commands
        with patch('subprocess.run') as mock_run:
            mock_run.side_effect = [
                Mock(returncode=0, stdout="", stderr=""),  # fetch tags
                Mock(returncode=1, stdout="", stderr="not on tag"),  # describe exact (fails)
                Mock(returncode=1, stdout="", stderr="no tags"),  # describe latest (fails)
                Mock(returncode=0, stdout="v7.12.0\nv7.11.0\nv7.10.0\n", stderr="")  # tag list
            ]
            
            version = repo_mgr.get_current_version(repo_path)
            
            assert version == "v7.12.0"  # Should pick first (most recent)


# ============================================================================
# Test 2: Update Checking (check_for_updates)
# ============================================================================

class TestCheckForUpdates:
    """Tests for check_for_updates() method."""
    
    def test_detects_newer_version_available(self, tmp_path):
        """Test 2a: Detects when newer version is available."""
        repo_mgr = RepositoryManager()
        repo_path = tmp_path / "test_repo"
        current_version = "v6.14.0"
        
        # Mock git commands
        with patch('subprocess.run') as mock_run:
            mock_run.side_effect = [
                Mock(returncode=0, stdout="", stderr=""),  # fetch tags
                Mock(returncode=0, stdout="v7.12.0\nv6.14.0\nv6.13.0\n", stderr="")  # tag list
            ]
            
            latest = repo_mgr.check_for_updates(repo_path, current_version)
            
            assert latest == "v7.12.0"
    
    def test_returns_none_when_up_to_date(self, tmp_path):
        """Test 2b: Returns None when cache is up-to-date."""
        repo_mgr = RepositoryManager()
        repo_path = tmp_path / "test_repo"
        current_version = "v7.12.0"
        
        # Mock git commands
        with patch('subprocess.run') as mock_run:
            mock_run.side_effect = [
                Mock(returncode=0, stdout="", stderr=""),  # fetch tags
                Mock(returncode=0, stdout="v7.12.0\nv7.11.0\nv7.10.0\n", stderr="")  # tag list
            ]
            
            latest = repo_mgr.check_for_updates(repo_path, current_version)
            
            assert latest is None
    
    def test_handles_network_failure_gracefully(self, tmp_path):
        """Test 2c: Handles network failures gracefully (returns None)."""
        repo_mgr = RepositoryManager()
        repo_path = tmp_path / "test_repo"
        current_version = "v6.14.0"
        
        # Mock git commands - fetch fails
        with patch('subprocess.run') as mock_run:
            mock_run.side_effect = subprocess.CalledProcessError(
                1, ['git', 'fetch'], stderr="network error"
            )
            
            latest = repo_mgr.check_for_updates(repo_path, current_version)
            
            assert latest is None
    
    def test_handles_no_remote_tags(self, tmp_path):
        """Test 2d: Handles repositories with no remote tags."""
        repo_mgr = RepositoryManager()
        repo_path = tmp_path / "test_repo"
        current_version = "v6.14.0"
        
        # Mock git commands
        with patch('subprocess.run') as mock_run:
            mock_run.side_effect = [
                Mock(returncode=0, stdout="", stderr=""),  # fetch tags
                Mock(returncode=0, stdout="\n", stderr="")  # tag list (empty)
            ]
            
            latest = repo_mgr.check_for_updates(repo_path, current_version)
            
            assert latest is None


# ============================================================================
# Test 3: Cache Update (update_cache)
# ============================================================================

class TestUpdateCache:
    """Tests for update_cache() method."""
    
    def test_successfully_updates_cache(self, tmp_path):
        """Test 3a: Successfully updates cache from main branch."""
        repo_mgr = RepositoryManager()
        repo_path = tmp_path / "test_repo"
        
        # Mock git commands
        with patch('subprocess.run') as mock_run:
            mock_run.side_effect = [
                Mock(returncode=0, stdout="", stderr=""),  # checkout main
                Mock(returncode=0, stdout="Already up to date.\n", stderr="")  # pull
            ]
            
            # Should not raise
            repo_mgr.update_cache(repo_path)
            
            assert mock_run.call_count == 2
            # Verify checkout main was called
            assert mock_run.call_args_list[0][0][0] == ['git', '-C', str(repo_path), 'checkout', 'main']
            # Verify pull was called
            assert mock_run.call_args_list[1][0][0] == ['git', '-C', str(repo_path), 'pull', 'origin', 'main']
    
    def test_handles_detached_head_state(self, tmp_path):
        """Test 3b: Handles detached HEAD state (switches to main first)."""
        repo_mgr = RepositoryManager()
        repo_path = tmp_path / "test_repo"
        
        # Mock git commands
        with patch('subprocess.run') as mock_run:
            mock_run.side_effect = [
                Mock(returncode=0, stdout="Switched to branch 'main'\n", stderr=""),  # checkout main
                Mock(returncode=0, stdout="Updating files...\n", stderr="")  # pull
            ]
            
            repo_mgr.update_cache(repo_path)
            
            # Verify checkout main was called first
            first_call = mock_run.call_args_list[0][0][0]
            assert first_call == ['git', '-C', str(repo_path), 'checkout', 'main']
    
    def test_raises_error_on_pull_failure(self, tmp_path):
        """Test 3c: Raises ConnectionError on git pull failure."""
        repo_mgr = RepositoryManager()
        repo_path = tmp_path / "test_repo"
        
        # Mock git commands - pull fails
        with patch('subprocess.run') as mock_run:
            mock_run.side_effect = [
                Mock(returncode=0, stdout="", stderr=""),  # checkout main
                subprocess.CalledProcessError(1, ['git', 'pull'], stderr="network error")  # pull fails
            ]
            
            with pytest.raises(ConnectionError) as exc_info:
                repo_mgr.update_cache(repo_path)
            
            assert "Failed to update cache" in str(exc_info.value)
    
    def test_works_when_already_on_main(self, tmp_path):
        """Test 3d: Works when already on main branch."""
        repo_mgr = RepositoryManager()
        repo_path = tmp_path / "test_repo"
        
        # Mock git commands
        with patch('subprocess.run') as mock_run:
            mock_run.side_effect = [
                Mock(returncode=0, stdout="Already on 'main'\n", stderr=""),  # checkout main
                Mock(returncode=0, stdout="Already up to date.\n", stderr="")  # pull
            ]
            
            # Should not raise
            repo_mgr.update_cache(repo_path)
            
            assert mock_run.call_count == 2


# ============================================================================
# Test 5: Orchestrator Integration
# ============================================================================

class TestOrchestratorIntegration:
    """Tests for orchestrator integration with version management."""
    
    def test_orchestrator_calls_update_cache_when_flag_set(self, tmp_path):
        """Test 5a: Orchestrator calls update_cache when flag is set."""
        # Create mock args
        args = Namespace(
            csp='gcp',
            service=['test_service'],
            provider_version=None,
            output_dir=tmp_path / 'docs',
            cache_dir=tmp_path / 'cache',
            dry_run=True,
            silent=False,
            update_cache=True  # Flag is set
        )
        
        orchestrator = Orchestrator(args)
        
        # Mock the repository manager methods
        with patch.object(orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(orchestrator.repo_manager, 'update_cache') as mock_update, \
             patch.object(orchestrator.repo_manager, 'get_current_version') as mock_version, \
             patch.object(orchestrator, '_determine_resources_to_process') as mock_determine, \
             patch.object(orchestrator, '_batch_extract_resources') as mock_extract, \
             patch.object(orchestrator, '_get_previous_version') as mock_prev:
            
            mock_clone.return_value = tmp_path / 'repo'
            mock_version.return_value = 'v6.14.0'
            mock_determine.return_value = []
            mock_extract.return_value = []
            mock_prev.return_value = None
            
            orchestrator.run()
            
            # Verify update_cache was called
            mock_update.assert_called_once_with(tmp_path / 'repo')
    
    def test_orchestrator_auto_detects_version_when_not_specified(self, tmp_path):
        """Test 5b: Orchestrator auto-detects version when not specified."""
        args = Namespace(
            csp='gcp',
            service=['test_service'],
            provider_version=None,  # Not specified
            output_dir=tmp_path / 'docs',
            cache_dir=tmp_path / 'cache',
            dry_run=True,
            silent=False,
            update_cache=False
        )
        
        orchestrator = Orchestrator(args)
        
        with patch.object(orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(orchestrator.repo_manager, 'get_current_version') as mock_version, \
             patch.object(orchestrator.repo_manager, 'check_for_updates') as mock_check, \
             patch.object(orchestrator, '_determine_resources_to_process') as mock_determine, \
             patch.object(orchestrator, '_batch_extract_resources') as mock_extract, \
             patch.object(orchestrator, '_get_previous_version') as mock_prev:
            
            mock_clone.return_value = tmp_path / 'repo'
            mock_version.return_value = 'v6.14.0'
            mock_check.return_value = None
            mock_determine.return_value = []
            mock_extract.return_value = []
            mock_prev.return_value = None
            
            orchestrator.run()
            
            # Verify get_current_version was called
            mock_version.assert_called_once_with(tmp_path / 'repo')
            # Verify version was set in args
            assert orchestrator.args.provider_version == 'v6.14.0'
    
    def test_orchestrator_checks_updates_only_when_auto_detected(self, tmp_path):
        """Test 5c: Orchestrator checks for updates only when version is auto-detected."""
        args = Namespace(
            csp='gcp',
            service=['test_service'],
            provider_version=None,  # Not specified - will auto-detect
            output_dir=tmp_path / 'docs',
            cache_dir=tmp_path / 'cache',
            dry_run=True,
            silent=False,
            update_cache=False
        )
        
        orchestrator = Orchestrator(args)
        
        with patch.object(orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(orchestrator.repo_manager, 'get_current_version') as mock_version, \
             patch.object(orchestrator.repo_manager, 'check_for_updates') as mock_check, \
             patch.object(orchestrator, '_determine_resources_to_process') as mock_determine, \
             patch.object(orchestrator, '_batch_extract_resources') as mock_extract, \
             patch.object(orchestrator, '_get_previous_version') as mock_prev:
            
            mock_clone.return_value = tmp_path / 'repo'
            mock_version.return_value = 'v6.14.0'
            mock_check.return_value = None
            mock_determine.return_value = []
            mock_extract.return_value = []
            mock_prev.return_value = None
            
            orchestrator.run()
            
            # Verify check_for_updates was called
            mock_check.assert_called_once_with(tmp_path / 'repo', 'v6.14.0')
    
    def test_orchestrator_skips_update_check_when_version_specified(self, tmp_path):
        """Test 5d: Orchestrator does NOT check for updates when version is specified."""
        args = Namespace(
            csp='gcp',
            service=['test_service'],
            provider_version='v6.14.0',  # Explicitly specified
            output_dir=tmp_path / 'docs',
            cache_dir=tmp_path / 'cache',
            dry_run=True,
            silent=False,
            update_cache=False
        )
        
        orchestrator = Orchestrator(args)
        
        with patch.object(orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(orchestrator.repo_manager, 'get_current_version') as mock_version, \
             patch.object(orchestrator.repo_manager, 'check_for_updates') as mock_check, \
             patch.object(orchestrator, '_determine_resources_to_process') as mock_determine, \
             patch.object(orchestrator, '_batch_extract_resources') as mock_extract, \
             patch.object(orchestrator, '_get_previous_version') as mock_prev:
            
            mock_clone.return_value = tmp_path / 'repo'
            mock_determine.return_value = []
            mock_extract.return_value = []
            mock_prev.return_value = None
            
            orchestrator.run()
            
            # Verify get_current_version was NOT called
            mock_version.assert_not_called()
            # Verify check_for_updates was NOT called
            mock_check.assert_not_called()
    
    def test_orchestrator_logs_warning_when_newer_version_available(self, tmp_path, caplog):
        """Test 5e: Orchestrator logs WARNING when newer version available."""
        import logging
        
        args = Namespace(
            csp='gcp',
            service=['test_service'],
            provider_version=None,
            output_dir=tmp_path / 'docs',
            cache_dir=tmp_path / 'cache',
            dry_run=True,
            silent=False,
            update_cache=False
        )
        
        orchestrator = Orchestrator(args)
        
        with patch.object(orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(orchestrator.repo_manager, 'get_current_version') as mock_version, \
             patch.object(orchestrator.repo_manager, 'check_for_updates') as mock_check, \
             patch.object(orchestrator, '_determine_resources_to_process') as mock_determine, \
             patch.object(orchestrator, '_batch_extract_resources') as mock_extract, \
             patch.object(orchestrator, '_get_previous_version') as mock_prev, \
             caplog.at_level(logging.WARNING):
            
            mock_clone.return_value = tmp_path / 'repo'
            mock_version.return_value = 'v6.14.0'
            mock_check.return_value = 'v7.12.0'  # Newer version available
            mock_determine.return_value = []
            mock_extract.return_value = []
            mock_prev.return_value = None
            
            orchestrator.run()
            
            # Verify WARNING was logged
            assert any('Newer version available' in record.message for record in caplog.records)
            assert any('v7.12.0' in record.message for record in caplog.records)
            assert any('--update-cache' in record.message for record in caplog.records)


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
