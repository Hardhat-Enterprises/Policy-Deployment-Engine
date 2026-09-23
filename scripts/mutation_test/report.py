from __future__ import annotations

import json
from pathlib import Path
from typing import Any


def write_json_report(
    results: dict[str, Any],
    destination: Path,
) -> None:
    """Write mutation-test results as formatted JSON."""

    destination.parent.mkdir(
        parents=True,
        exist_ok=True,
    )

    destination.write_text(
        json.dumps(
            results,
            indent=2,
            ensure_ascii=False,
        )
        + "\n",
        encoding="utf-8",
    )