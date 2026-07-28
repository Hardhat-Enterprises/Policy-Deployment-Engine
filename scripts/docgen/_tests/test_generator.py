"""Unit tests for generator helpers."""

from scripts.docgen.generator import TEST_SERVICE_COUNT, select_services

ALL = ["Cloud Storage", "BigQuery", "Compute Engine", "Cloud Run", "AlloyDB"]


def test_no_request_no_test_returns_all_sorted():
    assert select_services(ALL, requested=None, test_mode=False) == sorted(ALL)


def test_test_mode_without_request_is_capped():
    chosen = select_services(ALL, requested=None, test_mode=True)
    assert len(chosen) == TEST_SERVICE_COUNT


def test_explicit_request_is_honoured_in_full():
    chosen = select_services(ALL, requested=["Compute Engine", "Cloud Run", "AlloyDB"],
                             test_mode=False)
    assert chosen == sorted(["Compute Engine", "Cloud Run", "AlloyDB"])


def test_explicit_request_not_truncated_by_test_mode():
    """--service overrides --test: a 3-service request stays 3 even with --test."""
    requested = ["Compute Engine", "Cloud Run", "AlloyDB"]
    chosen = select_services(ALL, requested=requested, test_mode=True)
    assert chosen == sorted(requested)
    assert len(chosen) > TEST_SERVICE_COUNT


def test_fuzzy_match_is_case_and_space_insensitive():
    chosen = select_services(ALL, requested=["cloudstorage"], test_mode=False)
    assert chosen == ["Cloud Storage"]


def test_unmatched_request_yields_empty():
    assert select_services(ALL, requested=["does not exist"], test_mode=False) == []
