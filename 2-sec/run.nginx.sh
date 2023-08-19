# nginxコンテナ3つからなるグループを作成。myappラベルをつける。
kubectl run myapp --image=nginx:1.12 --replicas 3 --labals="app=myapp"
# 80番ポートで受けてmyappラベルのついたコンテナに流すLBを作成。
kubectl create service loadbalancer --tcp 80:80 myapp
# myappに外部からアクセスするためのIP Addressを取得。
kubectl get service myapp