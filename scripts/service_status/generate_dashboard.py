#!/usr/bin/env python3
"""
Generate a static HTML dashboard from APT inventory data or CSV.
"""

import csv
import html
import json
from datetime import datetime, timezone
from pathlib import Path


def parse_inventory_csv(csv_path):
    """Parse inventory CSV produced by completion_checker.py."""
    inventory = {}
    current_service = None

    with open(csv_path, newline='', encoding='utf-8') as f:
        reader = csv.reader(f)
        next(reader, None)  # header

        for row in reader:
            if not row or all(not cell.strip() for cell in row):
                continue

            service = row[0].strip() if len(row) > 0 else ''
            if service:
                try:
                    resource_count = int(row[1]) if len(row) > 1 and row[1].strip() else 0
                    total_attributes = int(row[2]) if len(row) > 2 and row[2].strip() else 0
                except ValueError:
                    resource_count = 0
                    total_attributes = 0

                resource_name = row[4].strip() if len(row) > 4 else ''
                try:
                    attribute_count = int(row[5]) if len(row) > 5 and row[5].strip() else 0
                except ValueError:
                    attribute_count = 0

                current_service = service
                inventory[service] = {
                    'resource_count': resource_count,
                    'total_attributes': total_attributes,
                    'resources': [],
                }
                if resource_name:
                    inventory[service]['resources'].append({
                        'name': resource_name,
                        'attributes': attribute_count,
                    })
                continue

            if not current_service:
                continue

            resource_name = row[4].strip() if len(row) > 4 else ''
            if not resource_name:
                continue

            try:
                attribute_count = int(row[5]) if len(row) > 5 and row[5].strip() else 0
            except ValueError:
                attribute_count = 0

            inventory[current_service]['resources'].append({
                'name': resource_name,
                'attributes': attribute_count,
            })

    return inventory


def inventory_summary(inventory):
    services = len(inventory)
    resources = sum(len(s['resources']) for s in inventory.values())
    attributes = sum(s['total_attributes'] for s in inventory.values())
    return services, resources, attributes


def generate_dashboard_html(inventory, output_file, generated_at=None):
    """Write a self-contained HTML dashboard."""
    if not inventory:
        raise ValueError('Inventory is empty')

    generated_at = generated_at or datetime.now(timezone.utc)
    if generated_at.tzinfo is None:
        generated_at = generated_at.replace(tzinfo=timezone.utc)
    generated_label = generated_at.astimezone(timezone.utc).strftime('%Y-%m-%d %H:%M UTC')

    services, resources, attributes = inventory_summary(inventory)
    payload = {
        'generated_at': generated_label,
        'summary': {
            'services': services,
            'resources': resources,
            'attributes': attributes,
        },
        'services': [
            {
                'name': name,
                'resource_count': data.get('resource_count', len(data.get('resources', []))),
                'total_attributes': data['total_attributes'],
                'resources': data['resources'],
            }
            for name, data in sorted(inventory.items(), key=lambda item: item[0].lower())
        ],
    }
    data_json = json.dumps(payload, separators=(',', ':'))

    doc = f"""<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Automated Policy Tracker | PDE</title>
  <style>
    :root {{
      --bg: #f8f9fa;
      --card: #ffffff;
      --text: #212529;
      --muted: #6c757d;
      --border: #e9ecef;
      --accent: #007bff;
      --accent-soft: #e7f1ff;
    }}
    * {{ box-sizing: border-box; }}
    body {{
      margin: 0;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      background: var(--bg);
      color: var(--text);
      padding: 2rem 1.25rem 3rem;
    }}
    .container {{ max-width: 1100px; margin: 0 auto; }}
    h1 {{
      text-align: center;
      margin: 0 0 0.35rem;
      font-size: 2rem;
      color: #343a40;
    }}
    .subtitle {{
      text-align: center;
      color: var(--muted);
      margin: 0 0 1.75rem;
      font-size: 0.95rem;
    }}
    .stats {{
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
      gap: 1rem;
      margin-bottom: 1.5rem;
    }}
    .stat {{
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 10px;
      padding: 1rem 1.1rem;
      text-align: center;
    }}
    .stat-value {{
      font-size: 1.75rem;
      font-weight: 700;
      color: var(--accent);
      line-height: 1.2;
    }}
    .stat-label {{
      color: var(--muted);
      font-size: 0.9rem;
      margin-top: 0.25rem;
    }}
    .toolbar {{
      display: flex;
      flex-wrap: wrap;
      gap: 0.75rem;
      align-items: center;
      margin-bottom: 1rem;
    }}
    .toolbar input {{
      flex: 1 1 260px;
      padding: 0.65rem 0.9rem;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 1rem;
    }}
    .toolbar select {{
      padding: 0.65rem 0.75rem;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 0.95rem;
      background: #fff;
    }}
    .meta {{
      color: var(--muted);
      font-size: 0.85rem;
      margin-left: auto;
    }}
    details.service {{
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 10px;
      margin-bottom: 0.65rem;
      overflow: hidden;
    }}
    details.service[open] {{
      border-color: #cfe2ff;
      box-shadow: 0 2px 8px rgba(0, 123, 255, 0.08);
    }}
    summary {{
      list-style: none;
      cursor: pointer;
      padding: 0.9rem 1rem;
      display: flex;
      flex-wrap: wrap;
      gap: 0.5rem 1rem;
      align-items: center;
    }}
    summary::-webkit-details-marker {{ display: none; }}
    .service-name {{
      font-weight: 600;
      flex: 1 1 220px;
    }}
    .badge {{
      display: inline-block;
      padding: 0.2rem 0.55rem;
      border-radius: 999px;
      background: var(--accent-soft);
      color: #0b5ed7;
      font-size: 0.8rem;
      font-weight: 600;
    }}
    table {{
      width: 100%;
      border-collapse: collapse;
      font-size: 0.92rem;
    }}
    th, td {{
      padding: 0.55rem 1rem;
      border-top: 1px solid var(--border);
      text-align: left;
    }}
    th {{
      background: #f1f3f5;
      color: #495057;
      font-weight: 600;
    }}
    tr:hover td {{ background: #fafbfc; }}
    .empty {{
      text-align: center;
      color: var(--muted);
      padding: 2rem 1rem;
      display: none;
    }}
    .footer {{
      margin-top: 1.5rem;
      text-align: center;
      color: var(--muted);
      font-size: 0.85rem;
    }}
    .footer a {{ color: var(--accent); }}
    @media (max-width: 640px) {{
      body {{ padding: 1.25rem 0.75rem 2rem; }}
      h1 {{ font-size: 1.5rem; }}
    }}
  </style>
</head>
<body>
  <motion.div class="container">
    <h1>Automated Policy Tracker</h1>
    <p class="subtitle">GCP service resource inventory for the Policy Deployment Engine</p>

    <div class="stats">
      <motion.div class="stat"><motion.div class="stat-value" id="stat-services">{services}</motion.div><motion.div class="stat-label">Services</motion.div></motion.div>
      <motion.div class="stat"><motion.div class="stat-value" id="stat-resources">{resources}</motion.div><motion.div class="stat-label">Resources</motion.div></motion.div>
      <motion.div class="stat"><motion.div class="stat-value" id="stat-attributes">{attributes}</motion.div><motion.div class="stat-label">Total attributes</motion.div></motion.div>
    </div>

    <div class="toolbar">
      <input type="search" id="search" placeholder="Search services or resources..." aria-label="Search">
      <select id="sort" aria-label="Sort services">
        <option value="name-asc">Sort: name (A-Z)</option>
        <option value="name-desc">Sort: name (Z-A)</option>
        <option value="resources-desc">Sort: most resources</option>
        <option value="attributes-desc">Sort: most attributes</option>
      </select>
      <span class="meta">Updated: <span id="generated-at">{html.escape(generated_label)}</span></span>
    </motion.div>

    <motion.div id="services"></motion.div>
    <p class="empty" id="empty-state">No services match your search.</p>

    <p class="footer">
      Generated from <code>docs/gcp/**/resource_json</code> &middot;
      <a href="resource_inventory.csv">Download CSV</a>
    </p>
  </motion.div>

  <script id="inventory-data" type="application/json">{data_json}</script>
  <script>
    const inventory = JSON.parse(document.getElementById('inventory-data').textContent);
    const servicesRoot = document.getElementById('services');
    const searchInput = document.getElementById('search');
    const sortSelect = document.getElementById('sort');
    const emptyState = document.getElementById('empty-state');

    function compareServices(a, b, mode) {{
      switch (mode) {{
        case 'name-desc':
          return b.name.localeCompare(a.name);
        case 'resources-desc':
          return b.resource_count - a.resource_count || a.name.localeCompare(b.name);
        case 'attributes-desc':
          return b.total_attributes - a.total_attributes || a.name.localeCompare(b.name);
        default:
          return a.name.localeCompare(b.name);
      }}
    }}

    function matchesFilter(service, query) {{
      if (!query) return true;
      const q = query.toLowerCase();
      if (service.name.toLowerCase().includes(q)) return true;
      return service.resources.some(r => r.name.toLowerCase().includes(q));
    }}

    function render() {{
      const query = searchInput.value.trim();
      const mode = sortSelect.value;
      const filtered = inventory.services
        .filter(service => matchesFilter(service, query))
        .sort((a, b) => compareServices(a, b, mode));

      servicesRoot.innerHTML = filtered.map(service => `
        <details class="service">
          <summary>
            <span class="service-name">${{service.name}}</span>
            <span class="badge">${{service.resource_count}} resources</span>
            <span class="badge">${{service.total_attributes}} attributes</span>
          </summary>
          <table>
            <thead>
              <tr><th>Resource</th><th>Attributes</th></tr>
            </thead>
            <tbody>
              ${{service.resources.map(resource => `
                <tr>
                  <td>${{resource.name}}</td>
                  <td>${{resource.attributes}}</td>
                </tr>
              `).join('')}}
            </tbody>
          </table>
        </details>
      `).join('');

      emptyState.style.display = filtered.length ? 'none' : 'block';
    }}

    searchInput.addEventListener('input', render);
    sortSelect.addEventListener('change', render);
    render();
  </script>
</body>
</html>
"""

    # Fix accidental motion.* tags from f-string brace escaping
    doc = doc.replace('<motion.', '<').replace('</motion.', '</')

    output_path = Path(output_file)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(doc, encoding='utf-8')
    return output_path
