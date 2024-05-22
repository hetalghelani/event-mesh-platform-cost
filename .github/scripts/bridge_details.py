import json
import sys
import re

with open(sys.argv[1], 'r') as file:
    services = json.load(file)

print(services)

bridges_config_nonprod = []
bridges_config_prod = []

for service_name_source, service_data in services.items():
    bridges = service_data.get("bridges", {})
    print(bridges)

    for bridge_name, bridge_info in bridges.items():
        if service_name_source.startswith('qa') or service_name_source.startswith('pro'):
            bridge_config = {
                "service_name_source": service_name_source,
                "service_name_remote": bridge_info["service_name_remote"],
                "service_site_source": service_name_source.split('-')[1][:3],
                "service_site_remote": bridge_info["service_name_remote"].split('-')[1][:3],
                "bridge_type": bridge_info["bridge_type"],
                "bridge_name": bridge_name.replace('#',"")
            }
            if bridge_config["service_site_source"] != bridge_config["service_site_remote"]:
                if service_name_source.startswith('qa'):
                    bridges_config_nonprod.append(bridge_config)
                elif service_name_source.startswith('pro'):
                    bridges_config_prod.append(bridge_config)

allbridges = f"bridges_config_nonprod = { json.dumps(bridges_config_nonprod, indent=4) }\n\nbridges_config_prod = { json.dumps(bridges_config_prod, indent=4) }\n"

# Replace colons with equal signs and remove double quotes from keys.
tfvars_content = re.sub(r'(\s*)"([^"]+)"\s*:\s*"([^"]+)"', r'\1\2 = "\3"', allbridges)

with open('terraform.tfvars',"w") as output_file:
    output_file.write(tfvars_content)
