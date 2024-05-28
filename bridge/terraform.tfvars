bridges_config_nonprod = [
    {
        service_name_source = "qa-aks-euwe-cgeu-1-bs-1",
        service_name_remote = "qa-dc8oc4-euse-cgeu-2-ts-1",
        service_site_source = "aks",
        service_site_remote = "dc8",
        bridge_type = "externalDMR",
        bridge_name = "cluster:8576a001858f000a627a4a4700000000"
    },
    {
        service_name_source = "qa-aks-euwe-cgeu-1-bs-1",
        service_name_remote = "qa-gke-euwe4-cgeu-1-il-1",
        service_site_source = "aks",
        service_site_remote = "gke",
        bridge_type = "externalDMR",
        bridge_name = "cluster:8576a001858f000a627a4a4700000005"
    },
    {
        service_name_source = "qa-aks-euwe-cgeu-1-bs-1",
        service_name_remote = "qa-dc8oc4-euse-cgeu-1-fu-1",
        service_site_source = "aks",
        service_site_remote = "dc8",
        bridge_type = "externalDMR",
        bridge_name = "cluster:dbf9a3096106000a63883eb700000000"
    },
    {
        service_name_source = "qa-ali-cnsh-cgap-1-cu-1",
        service_name_remote = "qa-dc9oc4-cnsh-cgap-1-fu-1",
        service_site_source = "ali",
        service_site_remote = "dc9",
        bridge_type = "externalDMR",
        bridge_name = "cluster:0284f1327cb3000a625c0d8a00000000"
    },
    {
        service_name_source = "qa-ali-cnsh-cgap-1-fu-1",
        service_name_remote = "qa-dc9oc4-cnsh-cgap-1-fu-1",
        service_site_source = "ali",
        service_site_remote = "dc9",
        bridge_type = "externalDMR",
        bridge_name = "cluster:80a6f26f69b1000a6169d20800000000"
    },
    {
        service_name_source = "qa-dc8oc4-euse-cgeu-1-cu-1",
        service_name_remote = "qa-dc9oc4-cnsh-cgap-1-cu-1",
        service_site_source = "dc8",
        service_site_remote = "dc9",
        bridge_type = "staticBridge",
        bridge_name = "qa-dc9oc4-cnsh-cgap-1_qa-dc8oc4-euse-cgeu-1"
    },
    {
        service_name_source = "qa-dc8oc4-euse-cgeu-1-fu-1",
        service_name_remote = "qa-gke-euwe4-cgeu-1-fu-1",
        service_site_source = "dc8",
        service_site_remote = "gke",
        bridge_type = "externalDMR",
        bridge_name = "cluster:6559afd63ffb000a60e7c09f00000000"
    },
    {
        service_name_source = "qa-dc8oc4-euse-cgeu-1-fu-1",
        service_name_remote = "qa-aks-euwe-cgeu-1-bs-1",
        service_site_source = "dc8",
        service_site_remote = "aks",
        bridge_type = "externalDMR",
        bridge_name = "cluster:e3da4d45d917000a6391776600000000"
    },
    {
        service_name_source = "qa-dc8oc4-euse-cgeu-1-fu-1",
        service_name_remote = "qa-dc9oc4-cnsh-cgap-1-fu-1",
        service_site_source = "dc8",
        service_site_remote = "dc9",
        bridge_type = "staticBridge",
        bridge_name = "qa-dc9oc4-cnsh-cgap-1_qa-dc8oc4-euse-cgeu-1"
    },
    {
        service_name_source = "qa-dc8oc4-euse-cgeu-1-il-1",
        service_name_remote = "qa-dc9oc4-cnsh-cgap-1-il-1",
        service_site_source = "dc8",
        service_site_remote = "dc9",
        bridge_type = "staticBridge",
        bridge_name = "qa-dc9oc4-cnsh-cgap-1_qa-dc8oc4-euse-cgeu-1"
    },
    {
        service_name_source = "qa-dc8oc4-euse-cgeu-2-bs-1",
        service_name_remote = "qa-dc9oc4-cnsh-cgap-1-bs-1",
        service_site_source = "dc8",
        service_site_remote = "dc9",
        bridge_type = "staticBridge",
        bridge_name = "qa-dc9oc4-cnsh-cgap-1_qa-dc8oc4-euse-cgeu-2"
    },
    {
        service_name_source = "qa-dc8oc4-euse-cgeu-2-ts-1",
        service_name_remote = "qa-gke-euwe4-cgeu-1-ts-1",
        service_site_source = "dc8",
        service_site_remote = "gke",
        bridge_type = "externalDMR",
        bridge_name = "cluster:acab13841e82000a623c4b6300000002"
    },
    {
        service_name_source = "qa-dc8oc4-euse-cgeu-2-ts-1",
        service_name_remote = "qa-aks-euwe-cgeu-1-bs-1",
        service_site_source = "dc8",
        service_site_remote = "aks",
        bridge_type = "externalDMR",
        bridge_name = "cluster:acab13841e82000a62c7ba0c00000000"
    },
    {
        service_name_source = "qa-dc9oc4-cnsh-cgap-1-bs-1",
        service_name_remote = "qa-dc8oc4-euse-cgeu-2-bs-1",
        service_site_source = "dc9",
        service_site_remote = "dc8",
        bridge_type = "staticBridge",
        bridge_name = "qa-dc9oc4-cnsh-cgap-1_qa-dc8oc4-euse-cgeu-2"
    },
    {
        service_name_source = "qa-dc9oc4-cnsh-cgap-1-cu-1",
        service_name_remote = "qa-dc8oc4-euse-cgeu-1-cu-1",
        service_site_source = "dc9",
        service_site_remote = "dc8",
        bridge_type = "staticBridge",
        bridge_name = "qa-dc9oc4-cnsh-cgap-1_qa-dc8oc4-euse-cgeu-1"
    },
    {
        service_name_source = "qa-dc9oc4-cnsh-cgap-1-fu-1",
        service_name_remote = "qa-ali-cnsh-cgap-1-fu-1",
        service_site_source = "dc9",
        service_site_remote = "ali",
        bridge_type = "externalDMR",
        bridge_name = "cluster:62495b31a18d000a615dcc8000000000"
    },
    {
        service_name_source = "qa-dc9oc4-cnsh-cgap-1-fu-1",
        service_name_remote = "qa-ali-cnsh-cgap-1-cu-1",
        service_site_source = "dc9",
        service_site_remote = "ali",
        bridge_type = "externalDMR",
        bridge_name = "cluster:62495b31a18d000a624db91d00000000"
    },
    {
        service_name_source = "qa-dc9oc4-cnsh-cgap-1-fu-1",
        service_name_remote = "qa-dc8oc4-euse-cgeu-1-fu-1",
        service_site_source = "dc9",
        service_site_remote = "dc8",
        bridge_type = "staticBridge",
        bridge_name = "qa-dc9oc4-cnsh-cgap-1_qa-dc8oc4-euse-cgeu-1"
    },
    {
        service_name_source = "qa-dc9oc4-cnsh-cgap-1-il-1",
        service_name_remote = "qa-dc8oc4-euse-cgeu-1-il-1",
        service_site_source = "dc9",
        service_site_remote = "dc8",
        bridge_type = "staticBridge",
        bridge_name = "qa-dc9oc4-cnsh-cgap-1_qa-dc8oc4-euse-cgeu-1"
    },
    {
        service_name_source = "qa-gke-euwe4-cgeu-1-fu-1",
        service_name_remote = "qa-dc8oc4-euse-cgeu-1-fu-1",
        service_site_source = "gke",
        service_site_remote = "dc8",
        bridge_type = "externalDMR",
        bridge_name = "cluster:68dae36a2d13000a6102c30100000000"
    },
    {
        service_name_source = "qa-gke-euwe4-cgeu-1-il-1",
        service_name_remote = "qa-aks-euwe-cgeu-1-bs-1",
        service_site_source = "gke",
        service_site_remote = "aks",
        bridge_type = "externalDMR",
        bridge_name = "cluster:f90158439dd9000a62bd9e7300000001"
    },
    {
        service_name_source = "qa-gke-euwe4-cgeu-1-ts-1",
        service_name_remote = "qa-dc8oc4-euse-cgeu-2-ts-1",
        service_site_source = "gke",
        service_site_remote = "dc8",
        bridge_type = "externalDMR",
        bridge_name = "cluster:edf8e9b76be8000a62138f9300000009"
    }
]

bridges_config_prod = [
    {
        service_name_source = "pro-aks-euwe-cgeu-1-bs-1",
        service_name_remote = "pro-gke-euwe4-cgeu-1-il-1",
        service_site_source = "aks",
        service_site_remote = "gke",
        bridge_type = "externalDMR",
        bridge_name = "cluster:9ef9de561720000a627a4bbd00000007"
    },
    {
        service_name_source = "pro-aks-euwe-cgeu-1-bs-1",
        service_name_remote = "pro-dc8oc4-euse-cgeu-2-ts-1",
        service_site_source = "aks",
        service_site_remote = "dc8",
        bridge_type = "externalDMR",
        bridge_name = "cluster:9ef9de561720000a65b8ef6a00000000"
    },
    {
        service_name_source = "pro-aks-euwe-cgeu-1-bs-1",
        service_name_remote = "pro-dc8oc4-euse-cgeu-1-fu-1",
        service_site_source = "aks",
        service_site_remote = "dc8",
        bridge_type = "externalDMR",
        bridge_name = "cluster:d8cb704b0db3000a636e53c100000000"
    },
    {
        service_name_source = "pro-ali-cnsh-cgap-1-cu-1",
        service_name_remote = "pro-dc9oc4-cnsh-cgap-1-fu-1",
        service_site_source = "ali",
        service_site_remote = "dc9",
        bridge_type = "externalDMR",
        bridge_name = "cluster:c209648b4d81000a6231a5c700000001"
    },
    {
        service_name_source = "pro-ali-cnsh-cgap-1-fu-1",
        service_name_remote = "pro-dc9oc4-cnsh-cgap-1-fu-1",
        service_site_source = "ali",
        service_site_remote = "dc9",
        bridge_type = "externalDMR",
        bridge_name = "cluster:bfa5df656228000a618d39d300000000"
    },
    {
        service_name_source = "pro-dc8oc4-euse-cgeu-1-cu-1",
        service_name_remote = "pro-dc9oc4-cnsh-cgap-1-cu-1",
        service_site_source = "dc8",
        service_site_remote = "dc9",
        bridge_type = "staticBridge",
        bridge_name = "pro-dc9oc4-cnsh-cgap-1_pro-dc8oc4-euse-cgeu-1"
    },
    {
        service_name_source = "pro-dc8oc4-euse-cgeu-1-fu-1",
        service_name_remote = "pro-gke-euwe4-cgeu-1-fu-1",
        service_site_source = "dc8",
        service_site_remote = "gke",
        bridge_type = "externalDMR",
        bridge_name = "cluster:69b65d9b2550000a60ff6a1000000002"
    },
    {
        service_name_source = "pro-dc8oc4-euse-cgeu-1-fu-1",
        service_name_remote = "pro-aks-euwe-cgeu-1-bs-1",
        service_site_source = "dc8",
        service_site_remote = "aks",
        bridge_type = "externalDMR",
        bridge_name = "cluster:cf4cf92d30c9000a637c2d7400000000"
    },
    {
        service_name_source = "pro-dc8oc4-euse-cgeu-1-fu-1",
        service_name_remote = "pro-dc9oc4-cnsh-cgap-1-fu-1",
        service_site_source = "dc8",
        service_site_remote = "dc9",
        bridge_type = "staticBridge",
        bridge_name = "pro-dc9oc4-cnsh-cgap-1_pro-dc8oc4-euse-cgeu-1"
    },
    {
        service_name_source = "pro-dc8oc4-euse-cgeu-1-il-1",
        service_name_remote = "pro-dc9oc4-cnsh-cgap-1-il-1",
        service_site_source = "dc8",
        service_site_remote = "dc9",
        bridge_type = "staticBridge",
        bridge_name = "pro-dc9oc4-cnsh-cgap-1_pro-dc8oc4-euse-cgeu-1"
    },
    {
        service_name_source = "pro-dc8oc4-euse-cgeu-2-bs-1",
        service_name_remote = "pro-dc9oc4-cnsh-cgap-1-bs-1",
        service_site_source = "dc8",
        service_site_remote = "dc9",
        bridge_type = "staticBridge",
        bridge_name = "pro-dc9oc4-cnsh-cgap-1_pro-dc8oc4-euse-cgeu-2"
    },
    {
        service_name_source = "pro-dc8oc4-euse-cgeu-2-ts-1",
        service_name_remote = "pro-aks-euwe-cgeu-1-bs-1",
        service_site_source = "dc8",
        service_site_remote = "aks",
        bridge_type = "externalDMR",
        bridge_name = "cluster:a1e41859a7fe000a6627268a00000000"
    },
    {
        service_name_source = "pro-dc8oc4-euse-cgeu-2-ts-1",
        service_name_remote = "pro-gke-euwe4-cgeu-1-ts-1",
        service_site_source = "dc8",
        service_site_remote = "gke",
        bridge_type = "externalDMR",
        bridge_name = "cluster:a1e41859a7fe000a6627268a00000001"
    },
    {
        service_name_source = "pro-dc9oc4-cnsh-cgap-1-bs-1",
        service_name_remote = "pro-dc8oc4-euse-cgeu-2-bs-1",
        service_site_source = "dc9",
        service_site_remote = "dc8",
        bridge_type = "staticBridge",
        bridge_name = "pro-dc9oc4-cnsh-cgap-1_pro-dc8oc4-euse-cgeu-2"
    },
    {
        service_name_source = "pro-dc9oc4-cnsh-cgap-1-cu-1",
        service_name_remote = "pro-dc8oc4-euse-cgeu-1-cu-1",
        service_site_source = "dc9",
        service_site_remote = "dc8",
        bridge_type = "staticBridge",
        bridge_name = "pro-dc9oc4-cnsh-cgap-1_pro-dc8oc4-euse-cgeu-1"
    },
    {
        service_name_source = "pro-dc9oc4-cnsh-cgap-1-fu-1",
        service_name_remote = "pro-ali-cnsh-cgap-1-fu-1",
        service_site_source = "dc9",
        service_site_remote = "ali",
        bridge_type = "externalDMR",
        bridge_name = "cluster:08025b9c6153000a617037ff00000001"
    },
    {
        service_name_source = "pro-dc9oc4-cnsh-cgap-1-fu-1",
        service_name_remote = "pro-ali-cnsh-cgap-1-cu-1",
        service_site_source = "dc9",
        service_site_remote = "ali",
        bridge_type = "externalDMR",
        bridge_name = "cluster:08025b9c6153000a623260fb00000000"
    },
    {
        service_name_source = "pro-dc9oc4-cnsh-cgap-1-fu-1",
        service_name_remote = "pro-dc8oc4-euse-cgeu-1-fu-1",
        service_site_source = "dc9",
        service_site_remote = "dc8",
        bridge_type = "staticBridge",
        bridge_name = "pro-dc9oc4-cnsh-cgap-1_pro-dc8oc4-euse-cgeu-1"
    },
    {
        service_name_source = "pro-dc9oc4-cnsh-cgap-1-il-1",
        service_name_remote = "pro-dc8oc4-euse-cgeu-1-il-1",
        service_site_source = "dc9",
        service_site_remote = "dc8",
        bridge_type = "staticBridge",
        bridge_name = "pro-dc9oc4-cnsh-cgap-1_pro-dc8oc4-euse-cgeu-1"
    },
    {
        service_name_source = "pro-gke-euwe4-cgeu-1-fu-1",
        service_name_remote = "pro-dc8oc4-euse-cgeu-1-fu-1",
        service_site_source = "gke",
        service_site_remote = "dc8",
        bridge_type = "externalDMR",
        bridge_name = "cluster:291fb84c0f5b000a610d194300000002"
    },
    {
        service_name_source = "pro-gke-euwe4-cgeu-1-il-1",
        service_name_remote = "pro-aks-euwe-cgeu-1-bs-1",
        service_site_source = "gke",
        service_site_remote = "aks",
        bridge_type = "externalDMR",
        bridge_name = "cluster:3787d56deab2000a62c2c40b00000003"
    },
    {
        service_name_source = "pro-gke-euwe4-cgeu-1-ts-1",
        service_name_remote = "pro-dc8oc4-euse-cgeu-2-ts-1",
        service_site_source = "gke",
        service_site_remote = "dc8",
        bridge_type = "externalDMR",
        bridge_name = "cluster:ea3f41766978000a65e6d0b000000000"
    }
]
