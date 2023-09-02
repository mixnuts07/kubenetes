# This repository is the personal note and record of the k8s complete guide book.

#### 2-Section

## List of things you can do with k8s.

- Management of multiple k8s Node
- Container scheduling
- Scaling and Auto-scaling
- Container dead/alive monitoring
- Self-healing in case of failure
- Service Discovery
- Load balancing
- Data management
- Workload management
- Log management
- Infrastructure as Code
- Integration and Extension with other ecosystem

#### 3-Section

## Resources(5)

- Workloads(7)...Resources for container execution on cluster.
  - Pod（デバッグや確認用途）
    - The smallest unit for Workloads, with one or more containers.
  - ReplicaSet (ReplicationController)（Pod をスケールさせて管理。Deployment 経由で利用。）
    - Create replicas of Pods and continue to maintain a specified number of Pods or more.
  - Deployment（スケールさせる WorkLoad に利用する）
    - manages multiple ReplicaSets, rolling updates, rollbacks, etc.
  - DaemonSet（各 Node に 1 つずつ Pod を配置したいとき）
    - Similar to ReplicaSet, a resource that places one Pod on each Node.(usecase... Fluentd, Datadog)
  - StatefulSet（データの永続化などステートを持つとき）
    - Similar to ReplicaSet, a resource for stateful workloads such as database.
    - Has a mechanism for persisting data.
  - Job（ワークキューやタスクなどコンテナの終了が必要な WorkLoad に利用する）
    - Resources that use container to perform one-time processing.(Ex. Batch)
  - CronJob（定期的に Job を実行したいとき）
    - Create jobs as scheduled times.
- Discovery & LB(2)
  - Service(7)
    - ClusterIP
    - ExternalIP
    - NodePod
    - LoadBalancer
    - Headless
    - ExternalName
    - None-Selector
  - Ingress
- Config & Storage(3)
  - Secret
  - ConfigMap
  - PersistentVolumeClaim
- Cluster(10)
  - Node
  - Namespace (Virtual k8s cluster isolation capability)
  - PersistentVolume
  - ResourceQuota
  - ServiceAccount
  - Role
  - ClusterRole
  - RoleBinding
  - ClusterRoleBinding
  - NetworkPolicy
- Metadata(4)
  - LimitRange
  - HorizontalPodAutoscaler
  - PodDisruptionBudget
  - CustomResourceDefinition

### 4-sec

- kubectl can operate on multiple environments with multiple permissions by switching contexts(cluster, user, namespace) in the kubeconfig file.

- Metadata

  - annotations ... system component(memo notes for resources)
  - labels ... resources(segregate resources)
