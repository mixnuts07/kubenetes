# nginxコンテナ3つからなるグループを作成。myappラベルをつける。
kubectl run myapp --image=nginx:1.12 --replicas 3 --labals="app=myapp"
# 80番ポートで受けてmyappラベルのついたコンテナに流すLBを作成。
kubectl create service loadbalancer --tcp 80:80 myapp
# myappに外部からアクセスするためのIP Addressを取得。
kubectl get service myapp

minikube start
# create resource
kubectl create -f sample.yml
# delete resource
kubectl delete -f sample.yml
# update resource
kubectl apply -f sample.yml

# get pods with specific labals
kubectl get pods -l labael=val1, val2

# kubectl get $(resources) --options -o(output type Ex. yaml, json)
kubectl get pods 
kubectl get nodes 
kubectl get all 
kubectl get pods -o custom-columns="NAME:{.metadata.name},NodeIP:{.status.hostIP}"
# json path
kubectl get pods sample-pod -o jsonpath="{.metadata.name}"
# describe resources
kubectl describe pod sample-pod
# actual resouce consumption (--containers... all containers every pod)
kubectl -n kube-system top node --containers
# execution on pod
kubectl exec -it sample-pod /bin/bash
# exec ls command on container
kubectl exec -it sample-pod ls
kubectl exec -it sample-pod -c CONTAINER_NAME ls
# check logs pod
kubectl logs sample-pod
# check logs all pods(partial match)
stern pod-name
# copy local-container
kubectl cp sample-pod:/etc/hostname .
# from local to container (port-forwading)
kubectl apply -f sample-pod.yaml # create sample-pod
kubectl port-forward sample-pod  8080:80 # local:8080, container:80
curl -I localhost:8080 # HTTP/1.1 200 OK
# debug(-v=6~)
kubectl -v=6 get nodes # Request, Response
kubectl -v=8 get nodes # Request Body, Response Body
# replica set
kubectl get replicasets -o wide
# scaling replicas
sed -e `s|replicas: 3|replicas: 5|` sample-pod.yml | kubectl apply -f - replicaset.apps "sample-rs" configured
# scaling replicas
kubectl scale rs sample-rs --replicas 5
# delete replicaset pods
kubectl delete replicaset sample-rs
# pod history
kubectl describe rs SAMPLE_POD
# create deployment (--recodr...アップデート時の履歴を保持することができる）
kubectl apply -f sample-deployment.yaml --record
# get replicas
kubectl get replicasets -o yaml | head
# get deployment
kubectl get deployments
# delete deployment
kubectl delete deployment sample-deployment
# update containr image deployments
kubectl set image deployment SAMPLE_DEPLOYMENT CONTAINER_NAME=nginx:1.13
# check deployment update 
kubectl rollout status deployment SAMPLE_DEPLOYMENT
# check change history
kubectl rollout history deployment SAMPLE_DEPLOYMENT
#　更新の一時停止
kubectl rollout pause deployment SAMPLE_DEPLOYMENT
#　更新の一時停止解除
kubectl rollout resume deployment SAMPLE_DEPLOYMENT
# display replicasets
kubectl get replicasets --watch
# scaling deployment with kubectl
kubectl scale deployment SAMPLE_DEPLOYMENT --replicas=5
# scaling deployment with manifest
sed -e `s|replicas: 3|replicas: 5|` SAMMPLE_DEPLOYMENT.yaml | kubectl apply -f - deployment.apps "sample-deloyment" configured
# create deployment with run
kubectl run sample-deployement-cli --image nginx:1.12 --replicas 3 --port 80
# delete daemonset
kubectl delete daemonset DAEMONSET_NAME
# get statefulset
kubectl get statefulsets
# get PersistentVolumeClaim(PersistentVolume 要求) on statefulset
kubectl get persistentvolumeclaims
# get PersistentVolume(永続化領域) on statefulset
kubectl get persistentvolumes
# scaling statefulsets
kubectl scale statefulset SAMPLE_STATEFULSET --replicas=5
# scaling statefulsets
sed -e `s|replicas: 3|replicas: 5|` SAMMPLE_STATEFULSET.yaml | kubectl apply -f - statefulset.apps "sample-statefulset" configured
# get jobs
kubectl get jobs
# get cronjob
kubectl get cronjobs
# create cronjob no using manifest
kubectl run SAMPLE_CRONJOB --schedule "*/1 * * * * " --restart Never --image centos:6 -- sleep 30
