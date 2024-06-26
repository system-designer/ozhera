{
"region": "chn-tianjin",
"zone": "ksywq",
"env": "online",
"job_name": "mione-china-cadvisor-k8s",
"scrape_interval": "30s",
"scrape_timeout": "10s",
"metrics_path": "/metrics",
"honor_labels": false,
"honor_timestamps": false,
"scheme": "http",
"relabel_configs": [
{
"regex": "(.*)",
"target_label": "system",
"replacement": "mione",
"action": "replace",
"separator": ";"
},
{
"source_labels": [
"__address__"
],
"regex": "(\\d+\\.\\d+\\.\\d+\\.\\d+).*",
"target_label": "ip",
"replacement": "$1",
"action": "replace"
}
],
"http_sd_configs": [
{
"url": "http://prometheus-agent.ozhera-namespace:8080/prometheus/getK8sNodeIp?type=container"
}
],
"metric_relabel_configs": [
{
"source_labels": [
"container_label_io_kubernetes_container_name"
],
"target_label": "container",
"regex": "(.+)",
"replacement": "$1",
"action": "replace"
},
{
"source_labels": [
"container_label_io_kubernetes_pod_name"
],
"target_label": "pod",
"regex": "(.+)",
"replacement": "$1",
"action": "replace"
},
{
"source_labels": [
"container_label_io_kubernetes_pod_namespace"
],
"target_label": "namespace",
"regex": "(.+)",
"replacement": "$1",
"action": "replace"
},
{
"source_labels": [
"container_env_application"
],
"target_label": "application",
"regex": "(.+)",
"replacement": "$1",
"action": "replace"
},
{
"source_labels": [
"container_env_serverenv"
],
"target_label": "serverEnv",
"regex": "(.+)",
"replacement": "$1",
"action": "replace"
},
{
"source_labels": [
"container_env_serverEnv"
],
"target_label": "serverEnv",
"regex": "(.+)",
"replacement": "$1",
"action": "replace"
},
{
"source_labels": [
"container_env_pod_ip"
],
"target_label": "podIp",
"regex": "(.+)",
"replacement": "$1",
"action": "replace"
},
{
"source_labels": [
"container_env_POD_IP"
],
"target_label": "podIp",
"regex": "(.+)",
"replacement": "$1",
"action": "replace"
},
{
"source_labels": [
"container_env_project_id"
],
"target_label": "container_label_PROJECT_ID",
"regex": "(.+)",
"replacement": "$1",
"action": "replace"
},
{
"source_labels": [
"container_env_env_id"
],
"target_label": "container_label_ENV_ID",
"regex": "(.+)",
"replacement": "$1",
"action": "replace"
},
{
"source_labels": [
"container_label_annotation_io_kubernetes_container_restartCount"
],
"target_label": "restartCounts",
"regex": "(.+)",
"replacement": "$1",
"action": "replace"
},
{
"source_labels": ["__name__"],
"regex":"container_network_(advance_tcp_stats_total|tcp6_usage_total|tcp_usage_total)",
"action":"drop"
},
{
"regex": "(container_label_io_kubernetes_container_name|container_label_io_kubernetes_pod_name|container_label_io_kubernetes_pod_namespace|id|container_env_application|container_env_serverenv|container_env_project_id|container_env_env_id|container_label_annotation_io_kubernetes_container_restartCount|container_env_pod_ip|container_env_serverEnv|container_env_POD_IP)",
"action": "labeldrop"
}
]
}