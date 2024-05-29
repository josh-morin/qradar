import requests

# qradar http header
header = {
    'Version': '20.0',
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Allow-Hidden': 'true',
    'SEC': 'generated sec token here',
}

# qradar ip address
ip_address = 'qradar console ip address here'

endpoints = [
    f'https://{ip_address}/api/system/about',
    f'https://{ip_address}/api/config/deployment/licenses',
    f'https://{ip_address}/api/config/deployment/license_pool',
    f'https://{ip_address}/api/config/event_retention_buckets',
    f'https://{ip_address}/api/config/disaster_recovery/disaster_recovery_config',
    f'https://{ip_address}/api/config/backup_and_restore/scheduled_backup_configurations',
    f'https://{ip_address}/api/system/notifications',
    f'https://{ip_address}/api/system/servers',
    f'https://{ip_address}/api/configuration/log_sources?fields=description%2Cenabled',
    f'https://{ip_address}/api/gui_app_framework/applications?fields=application_state(status)%2Cmanifest(description)',
    f'https://{ip_address}/api/health_data/security_data_count',
    f'https://{ip_address}/api/usermanagement/users'
]

responses = {}

for endpoint in endpoints:
    response = requests.get(endpoint, headers=header, verify=False)

    if response.status_code == 200:
        data = response.json()
        responses[endpoint] = data
    else:
        print(f"Failed to fetch data from {endpoint}. Status code: {response.status_code}")


def json_to_html_tables(json_data):
    html_content = """
    <html>
    <head>
    <title>QRadar Status Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
    </head>
    <body>
    <h1>QRadar Status Report</h1>
    """

    for endpoint, data in json_data.items():
        html_content += f"<h3>{endpoint}</h3>"
        html_content += "<table>"

        if isinstance(data, list):
            keys = set()
            for item in data:
                keys.update(item.keys())
            keys = sorted(keys)

            html_content += "<tr>"
            for key in keys:
                html_content += f"<th>{key}</th>"
            html_content += "</tr>"

            for item in data:
                html_content += "<tr>"
                for key in keys:
                    html_content += f"<td>{item.get(key, '')}</td>"
                html_content += "</tr>"

        elif isinstance(data, dict):
            for key, value in data.items():
                html_content += "<tr>"
                html_content += f"<th>{key}</th>"
                html_content += f"<td>{value}</td>"
                html_content += "</tr>"

        html_content += "</table>"

    html_content += "</body></html>"
    return html_content


html_content = json_to_html_tables(responses)

with open('qradar_report.html', 'w') as html_file:
    html_file.write(html_content)
