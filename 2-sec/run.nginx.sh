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

