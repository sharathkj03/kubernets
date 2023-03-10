apt update && apt upgrade -y && apt dist-upgrade -y
apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg2 net-tools
hostnamectl set-hostname $(curl -s http://169.254.169.254/latest/meta-data/local-hostname)
apt install -y docker.io
cat << EOF > /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

systemctl stop docker
systemctl start docker
systemctl enable docker
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

sysctl --system
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt update
apt install kubelet="1.22.17-00" 
apt install kubeadm="1.22.17-00"
apt install kubectl="1.22.17-00"
cat << EOF > /etc/kubernetes/aws.yaml
---
apiVersion: kubeadm.k8s.io/v1beta2
kind: ClusterConfiguration
networking:
  serviceSubnet: "10.100.0.0/16"
  podSubnet: "10.244.0.0/16"
apiServer:
  extraArgs:
    cloud-provider: "aws"
controllerManager:
  extraArgs:
    cloud-provider: "aws"
EOF

kubeadm init --config /etc/kubernetes/aws.yaml
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://docs.projectcalico.org/manifests/calico-typha.yaml
kubectl get nodes
kubectl get podes -a
kubectl get podes -A
kubectl get pods -A
A -owide
kubectl get pods -A
kubectl get nodes
kubectl get pods -A -owide
kubectl get pods -n kube-system
kubectl get pods -owide
clear
kubectl get ns
vi myfirstpod.yaml
kubectl create -f myfirstpod.yaml
kubectl get pods
kubectl get pods -owide
kubectl get nodes
curl -v 10.244.246.129
curl -v 10.244.246.129:8080
curl -v 10.244.246.129:80
kubectl delete pod tomcat-jenkins
history
cat myfirstpod.yaml 
vi myfirstpod.yaml 
ls
vi myfirstpod.yaml 
kubectl create -f myfirstpod.yaml
vi service.yaml 
kubectl create -f service.yaml 
kubectl get services
vi nodeport.yaml 
kubectl create -f nodeport.yaml 
kubectl get services
vi load.yaml 
kubectl create -f load.yaml 
kubectl get services
vi external.yaml
kubectl create -f external.yaml 
kubectl get services
kubectl get pods
kubectl delete pod tomcat-jenkins
ls
kubectl get pods
kubectl create -f myfirstpod.yaml 
kubectl get pods
vi replicaset.yaml
kubectl create -f replicaset.yaml 
kubectl get pods
kubectl get replicaset
vi replicaset.yaml
kubectl create -f replicaset.yaml 
kubectl get endpoints
kubectl get pods
kubectl get services
kubectl delete replicaset tomcat
kubectl create -f replicaset.yaml 
kubectl get pods
vi deployment.yaml
kubectl create -f deployment.yaml 
kubectl get pods
vi replicaset.yaml
vi deployment.yaml
kubectl delete replicaset tomcat
kubectl get pods
vi deployment.yaml
kubectl delete deployment tomcat
kubectl get pods
kubectl create -f myfirstpod.yaml 
kubectl get pods
kubectl get namespace
vi devnamespace.yaml
kubectl create -f devnamespace.yaml 
kubectl get namespace
kubectl apply -f myfirstpod.yaml --namespace=dev-namespace
kubectl get pods -n dev-namespace
kubectl delete myfirstpod.yml --namespace=dev-namespace
kubectl get pods -n dev-namespace
kubectl delete tomcat-jenkins --namespace=dev-namespace
vi myfirstpod.yaml 
kubectl delete tomcat-jenkins -n dev-namespace
kubectl delete pod tomcat-jenkins -n dev-namespace
kubectl apply -f myfirstpod.yaml --namespace=dev-namespace
kubectl get namespace
kubectl apply -f myfirstpod.yaml --namespace=dev-namespace
kubectl apply -f myfirstpod.yaml
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml
kubectl get pods -n dev-namespace
kubectl describe namespace tomcat-jenkins
kubectl describe namespace dev-namespace
vi resourcequote.yaml
kubectl apply -f resourcequote.yaml 
kubectl get resourcequota 
kubectl get resourcequota -n dev-namespace
kubectl describe namespace dev-namespace
vi pod limit.yaml
vi podlimit.yaml
kubectl apply -f podlimit.yaml 
vi podlimit.yaml
kubectl apply -f podlimit.yaml 
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl describe namespace dev-namespace
kubectl get pods -n dev-namespace
kubectl apply -f deployment.yaml 
vi deployment.yaml 
kubectl get pods -n dev-namespace
kubectl get resourcequota -n dev-namespace
kubectl get replicaset -n dev-namespace
kubectl describe replicaset tomcat-944dbf64c
kubectl describe replicaset tomcat-944dbf64c -n dev-namespace
vi limit.yaml
kubectl apply -f limit.yaml
vi limit.yaml
kubectl describe namespace dev-namespace
history
ls
vi deployment.yaml 
kubectl get pods
kubectl get pods -n dev-namespace
kubectl delete pod tomcat-jenkins
kubectl delete pod tomcat-jenkins -n dev-namespace
kubectl delete pod tomcat-944dbf64c-h54dg -n dev-namespace
kubectl delete -f deployment.yaml
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml -n dev-namespace
kubectl get nodes
kubectl taint node ip-10-0-0-41.ap-northeast-1.compute.internal colour=red:NoSchedule
kubectl describe node ip-10-0-0-41.ap-northeast-1.compute.internal
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
kubectl taint node ip-10-0-0-41.ap-northeast-1.compute.internal colour=red:NoSchedule-
vi deployment.yaml 
kubectl label node ip-10-0-0-41.ap-northeast-1.compute.internal size=small
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
kubectl apply -f deployment.yaml 
kubectl delete -f deployment.yaml
kubectl apply -f deployment.yaml 
vi deployment.yaml 
kubectl apply -f deployment.yaml 
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
vi deployment.yaml 
kubectl apply -f deployment.yaml 
vi deployment.yaml 
kubectl get pods -owide -n dev-namespace
kubectl delete -f deployment.yaml
kubectl get pods -owide -n dev-namespace
vi deployment.yaml 
kubectl get resourcequota -n dev-namespace
kubectl delete resourcequota memory-cpu-quota podquota
kubectl delete resourcequota memory-cpu-quota podquota -n dev-namespace
kubectl get resourcequota -n dev-namespace
kubectl get limit range -n dev-namespace
kubectl get limitrange -n dev-namespace
kubectl delete limitrange memory-range -n dev-namespace
kubectl delete -f deployment.yaml
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
vi deployment.yaml 
kubectl delete -f deployment.yaml
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
vi deployment.yaml 
kubectl delete -f deployment.yaml
kubectl get pods -owide -n dev-namespace
kubectl delete -f deployment.yaml

cp deployment.yaml podaffinity.yaml
vi podaffinity.yaml 
kubectl apply -f podaffinity.yaml 
kubectl get pods -owide -n dev-namespace
vi podaffinity.yaml 
kubectl delete -f deployment.yaml
kubectl apply -f podaffinity.yaml 
vi podaffinity.yaml 
kubectl apply -f podaffinity.yaml 
kubectl get pods -owide -n dev-namespace
kubectl get pods -n dev-namespace
vi podaffinity.yaml 
kubectl get pods -owide -n dev-namespace
kubectl get pods -n dev-namespace
kubectl get pods -owide -n dev-namespace
kubectl get pods -n dev-namespace
kubectl get pods -owide -n dev-namespace
clear
kubectl get pods -owide -n dev-namespace
kubectl get pods -n dev-namespace
vi podaffinity.yaml 
kubectl get pods -owide -n dev-namespace
kubectl delete -f deployment.yam
cp myfirstpod.yaml daemon.yaml
vi daemon.yaml 
kubectl delete -f deployment.yaml
kubectl apply -f myfirstpod.yaml 
kubectl apply -f daemon.yaml 
vi daemon.yaml 
kubectl apply -f daemon.yaml 
vi daemon.yaml 
kubectl apply -f daemon.yaml 
vi daemon.yaml 
kubectl apply -f daemon.yaml 
clear
vi daemon.yaml 
ls
vi myfirstpod.yaml 
vi daemon.yaml 
kubectl apply -f daemon.yaml 
kubectl apply -f myfirstpod.yaml 
kubectl get pods -n dev-namespace
vi daemon.yaml 
kubectl apply -f daemon.yaml 
vi daemon.yaml 
kubectl apply -f daemon.yaml 
vi daemon.yaml 
kubectl apply -f daemon.yaml 
vi daemon.yaml 
kubectl apply -f daemon.yaml 
vi daemon.yaml 
kubectl apply -f daemon.yaml 
vi daemon.yaml 
kubectl apply -f daemon.yaml 
vi daemon.yaml 
kubectl get pods -n dev-namespace
clear
kubectl get pods -n dev-namespace
kubectl delete -f tomcatdeployment-hhm2b -n dev-namespace
kubectl delete pod -f tomcatdeployment-hhm2b -n dev-namespace
kubectl get pods -owide -n dev-namespace
kubectl delete all --all
kubectl apply -f myfirstpod.yaml 
kubectl get pods -owide -n dev-namespace
kubectl get pods -n dev-namespace
kubectl delete all --all
kubectl get pods -n dev-namespace
kubectl delete all --all -n dev-namespace
kubectl apply -f myfirstpod.yaml 
kubectl get pods -n dev-namespace
kubectl describe pod tomcat-jenkins
kubectl describe pod tomcat-jenkins -n dev-namespace
kubectl delete -f myfirstpod.yaml 
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
kubectl describe pod tomcat-jenkins -n dev-namespace
kubectl delete -f myfirstpod.yaml 
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
kubectl describe pod tomcat-jenkins -n dev-namespace
kubectl delete -f myfirstpod.yaml 
clear
mkdir -p jenkins
chmod -R 777 jenkins
ls
cp myfirstpod.yaml data.yaml
vi data.yaml 
kubectl get nodes --show-labels
clear
kubectl apply -f data.yaml 
vi data.yaml 
kubectl apply -f data.yaml 
kubectl get pods 
vi data.yaml 
kubectl get pods -owide
kubectl delete -f data.yaml 
kubectl apply -f data.yaml 
kubectl get pods -owide
clear
kubectl get pods -owide
ls
cd jenkins/
ls
clear
cd
ls
rm -rf jenkins
ls

vi deployment.yaml 
kubectl apply -f deployment.yaml 
vi deployment.yaml 
kubectl apply -f deployment.yaml 
clear
vi deployment.yaml 
kubectl apply -f deployment.yaml 
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide
kubectl delete -f data.yaml 
kubectl get pods -owide -n dev-namespace
kubectl exec -it jenkins-665648dd94-ntsf6 -/bin/sh
kubectl exec -it jenkins-665648dd94-ntsf6-pod -- /bin/sh
kubectl exec -it jenkins-665648dd94-ntsf6 -- /bin/sh
kubectl exec -it jenkins-665648dd94-ntsf6 -- /bin/sh -n dev-namespace
kubectl exec -it jenkins-665648dd94-ntsf6 -n dev-namespace -- /bin/sh
kubectl get pods -owide
kubectl get pods -owide -n dev-namespace
vi deployment.yaml 
cat deployment.yaml 
kubectl delete -f deployment.yaml 
vi configmap.yaml
kubectl apply -f configmap.yaml 
kubectl get pods -owide
kubectl get configmap
vi pod-config.yaml
kubectl apply -f pod-config.yaml 
kubectl exec -it configmap-demo-pod -- /bin/sh
kubectl get nodes
kubectl get cm 
kubectl get cm game-demo -oyaml
vi secrets.yaml
kubectl apply -f secrets.yaml 
kubectl get secrets
kubectl get secrets mysecret -oyaml
echo "MWYyZDFlMmU2N2Rm" | base64 --decode
echo "YWRtaW4=" | base64 --decode
echo "sharath" | base64
echo "hassan" | base64
vi secrets.yaml
kubectl create secret generic db-user-pass     --from-literal=username=admin     --from-literal=password='S!B\*d$zDsb='
kubectl get secrets
kubectl get secrets db-user-pass -oyaml
vi username.txt
vi admin.conf
kubectl create secret generic myfile --from-file=./username.txt --from-file=./admin.conf
kubectl get secrets myfile -oyaml
echo "aGFzc2FuCmJhbmdsb3JlCm15c3VydQo=" | base64 --decode
echo "c2hhcmF0aAp2aW5pCmViZW4KeWV0aXNoCg==" | base64 --decode
vi secretpod.yaml
kubectl get pods
ls
cat secretpod.yaml 
kubectl apply -f secretpod.yaml 
kubectl exec -it secret-test-pod -- /bin/sh
cd /opt
mkdir -p efs
chmod -R 777 efs
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0c6bdf578769d1b21.efs.ap-northeast-1.amazonaws.com:/ efs
apt-get -y install nfs-common
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0c6bdf578769d1b21.efs.ap-northeast-1.amazonaws.com:/ efs
df -h
clear
cd
kubectl delete -f deployment.yaml 
vi deployment.yaml 
kubectl delete -f secretpod.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -n dev-namespace
kubectl delete -f deployment.yaml 
kubectl get pods -n dev-namespace
kubectl get pods
kubectl delete -f configmap.yaml 
kubectl delete -f configmap-demo-pod
kubectl get pods
kubectl get pods -owide
kubectl delete -f configmap-demo-pod
ls
kubectl delete -f pod-config.yaml 
kubectl get pods -owide
kubectl delete -f pod-config.yaml 
kubectl get pods -owide
kubectl apply -f deployment.yaml 
kubectl get pods -n dev-namespace
kubectl get pods -owide -n dev-namespace
kubectl delete -f deployment.yaml 
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
kubectl delete -f deployment.yaml 
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
kubectl describe pods jenkins-9fdcb8974-446ls -n dev-namespace
vi deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
kubectl describe pods jenkins-bc4c88479-8shks -n dev-namespace
kubectl delete all --all
kubectl delete -f deployment.yaml 
kubectl delete all --all
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
vi deployment.yaml 
kubectl delete all --all
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
kubectl describe pods jenkins-8574db7c87-2nlts -n dev-namespace
kubectl delete -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
kubectl get pods
vi deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
cd /opt
ls
cd efs/
ls
cd
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
kubectl describe pods jenkins-6db9c5df65-bgqdc -n dev-namespace
kubectl get pods
kubectl get pods -n dev-namespace
kubectl get pods -owide -n dev-namespace
kubectl get pods
kubectl get pods -owide -n dev-namespace
kubectl delete -f deployment.yaml 
chmod -R 777 /opt/efs
cd /opt/
ls
cd efs
ls
cd ..
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0c6bdf578769d1b21.efs.ap-northeast-1.amazonaws.com:/ efs
df -h
cd
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
kubectl delete -f deployment.yaml 
vi deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
vi deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-namespace
ls
vi myfirstpod.yaml 
history
ls
vi myfirstpod.yaml 
vi service.yaml 
vi nodeport.yaml
vi load.yaml 
vi deployment.yaml 
vi replicaset.yaml 
vi deployment.yaml 
vi resourcequote.yaml 
vi deployment.yaml 
vi secrets.yaml 
vi secretpod.yaml 
history
clear
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.14"
kubectl get pods -A
clear
vi stat-pv.yaml
kubectl apply -f stat-pv.yaml 
vi stat-pvc.yaml
kubectl delete -f stat-pv.yaml 
vi class.yaml
kubectl apply -f stat-pv.yaml 
vi stat-pvc.yaml
kubectl apply -f stat-pvc.yaml 
kubectl get pv
kubectl get pvc
vi stat-pod.yaml
kubectl apply -f stat-pod.yaml 
kubectl get pods
kubectl describe pod app
vi class.yaml 
kubectl delete -f stat-pod.yaml 
kubectl delete -f stat-pvc.yaml 
kubectl delete -f stat-pv.yaml 
kubectl apply -f class.yaml 
kubectl apply -f stat-pv.yaml 
vi dy-pvc.yaml
kubectl apply -f dy-pvc.yaml 
vi dy-pod.yaml
kubectl apply -f dy-pod.yaml 
kubectl get pods
kubectl describe pod app
kubectl delete -f dy-pod.yaml 
kubectl delete -f dy-pvc.yaml 
kubectl delete -f stat-pv.yaml 
kubectl get sc
kubectl delete -f class.yaml
mkdir -p sharath
cp -r .* sharath/
ls
rm -rf sharath
clear
ls
vi class.yaml
vi dy-pvc.yaml 
kubectl apply -f class.yaml 
kubectl apply -f dy-pvc.yaml 
vi dy-pod.yaml 
kubectl get pv
kubectl get pvc
kubectl apply -f dy-pod.yaml 
kubectl get pvc
kubectl get pods
clear
kubectl get pvc
kubectl get pods
kubectl get pv
kubectl describe pod app
clear
kubectl delete -f dy-pod.yaml 
kubectl delete -f dy-pvc.yaml 
kubectl delete -f class.yaml
clear
vi statefullset.yaml
vi class.yaml 
kubectl apply -f class.yaml 
vi statefullset.yaml
kubectl apply -f statefullset.yaml 
kubectl get pods
kubectl get pv
kubectl get svs
kubectl get services
kubectl get svc
clear
kubectl get pods
kubectl get pv
kubectl get svc
vi statefullset.yaml
kubectl delete -f statefullset.yaml 
clear
vi live.yaml
kubectl apply -f live.yaml 
kubectl get pods
clear
kubectl get pods
cat live.yaml 
vi live.yaml
kubectl delete -f live.yaml 
kubectl apply -f live.yaml 
kubectl get pods
kubectl delete -f live.yaml 
clear
vi rediness.yaml
cp live.yaml rediness.yaml
vi rediness.yaml
kubectl apply -f rediness.yaml 
kubectl get pods
kubectl describe pod liveness-exec
kubectl get pods

kubectl delete -f rediness.yaml 
vi startup.yaml
kubectl apply -f startup.yaml 
vi startup.yaml
kubectl apply -f startup.yaml 
vi startup.yaml
los
ls
clear
kubectl apply -f rediness.yaml 
kubectl get pods
kubectl delete -f rediness.yaml 
cp live.yaml startup.yaml 
vi startup.yaml
kubectl apply -f startup.yaml
kubectl get pods
clear
kubectl apply -f live.yaml 
clear
kubectl delete -f live.yaml 
kubectl apply -f live.yaml 
kubectl get pods
kubectl describe pod liveness-exec
kubectl delete -f live
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
kubectl get pods
kubectl get pods -n dev-namespace
kubectl get pods -n dev-namespace -owide
kubectl delete -f myfirstpod.yaml 
kubectl delete -f deployment.yaml 
kubectl get pods
kubectl get pods -n dev-namespace -owide
clear
ls
vi myfirstpod.yaml 
vi test.yaml
vi myfirstpod.yaml 
vi test.yaml
clear
cat service.yaml 
vi test.yaml
ls
cat nodeport.yaml 
cat load.yaml 
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 401541481683.dkr.ecr.ap-northeast-1.amazonaws.com
apt  install awscli
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 401541481683.dkr.ecr.ap-northeast-1.amazonaws.com
claer
clear
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 401541481683.dkr.ecr.ap-northeast-1.amazonaws.com
docker pull sharath03/tomcat:9.0
docker tag sharath03/tomcat:9.0 401541481683.dkr.ecr.ap-northeast-1.amazonaws.com/tomcat:1.1.0
docker push 401541481683.dkr.ecr.ap-northeast-1.amazonaws.com/tomcat:1.1.0
kubectl create secret docker-registry regcred --docker-server=<https://index.docker.io/v1/> --docker-username=<sharath03> --docker-password=<Snoofy@13> --docker-email=<sharathkj68@gmail.com>
kubectl create secret docker-registry regcred \--docker-server=<https://index.docker.io/v1/> --docker-username=<sharath03> --docker-password=<Snoofy@13> --docker-email=<sharathkj68@gmail.com>
kubectl create secret docker-registry regcred --docker-server=<https://index.docker.io/v1/> --docker-username=<sharath03> --docker-password=<Snoofy@13> --docker-email=<sharathkj68@gmail.com>
kubectl create secret docker-registry regcred --docker-server=<https://index.docker.io/v1/> --docker-username=<sharath03> --docker-password=<Snoofy@13> --docker-email=<sharathkj68@gmail.com>
kubectl create secret docker-registry regcred --docker-server=<https://index.docker.io/v1/> --docker-username=<sharath03> --docker-password=<Snoofy@13> --docker-email=<sharathkj68@gmail.com>
kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=sharath03 --docker-password=Snoofy@13 --docker-email=sharathkj68@gmail.com
vi privatepod.yaml
kubectl apply -f privatepod.yaml 
kubectl get pods
cat privatepod.yaml 
vi privatepod.yaml
kubectl delete -f privatepod.yaml 
kubectl apply -f privatepod.yaml 
vi load.yaml 
kubectl apply -f load.yaml 
kubectl delete -f privatepod.yaml 
kubectl delete -f load.yaml 
clear
cat load.yaml 
cat nodeport.yaml 
clear
cat replicaset.yaml 
vi test.yaml 
cat deployment.yaml 
vi test.yaml 
clear
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
kubectl get svc -n ingress-nginx
kubectl describe svc ingress-nginx-controller
kubectl describe svc ingress-nginx-controller -n ingress-nginx
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
clear
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
clear
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
kubectl describe svc ingress-nginx-controller -n ingress-nginx
kubectl get svc -n ingress-nginx
kubectl get all -n ingress-nginx
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
clear
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
clear
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
clear
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
kubectl get all -n ingress-nginx
kubectl get svc -n ingress-nginx -owide
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
clear
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
kubectl get svc -n ingress-nginx -owide
kubectl get all -n ingress-nginx
clear
vi ingresstom.yaml
kubectl get all -n ingress-nginx
vi ingresstom.yaml
kubectl apply -f ingresstom.yaml 
vi tomcatingress.yaml
kubectl apply -f tomcatingress.yaml 
kubectl get ing
vi ingresstom.yaml
kubectl apply -f ingresstom.yaml 
kubectl get all -n ingress-nginx
ls
vi jenkins.yaml
kubectl apply -f jenkins.yaml 
vi jenkingress.yaml
kubectl apply -f jenkingress.yaml 
kubectl get ing
vi jenkins.yaml
vi deployment.yaml 
vi jenkins.yaml
kubectl apply -f jenkins.yaml 
kubectl get svc
curl 10.100.70.203:8080
curl -v 10.100.70.203:8080
curl -v 10.100.70.203:8080/jenkins
clear
curl -v 10.100.70.203:8080/jenkins/
vi jenkins.yaml 
kubectl delete -f jenkins.yaml 
kubectl apply -f jenkins.yaml 
kubectl get svc
curl -v 10.100.94.172:8080/jenkins/
kubectl get pods
kubectl describe pod jenkins-7d994b4bcb-m5kzt
kubectl get nodes -owide
kubectl get pods
kubectl describe node ip-10-0-0-41.ap-northeast-1.compute.internal
kubectl taint nodes ip-10-0-0-41.ap-northeast-1.compute.internal size=small-
kubectl describe node ip-10-0-0-56.ap-northeast-1.compute.internal
kubectl taint nodes ip-10-0-0-41.ap-northeast-1.compute.internal size=small -
kubectl taint nodes ip-10-0-0-41.ap-northeast-1.compute.internal size=small:-
kubectl untaint nodes ip-10-0-0-41.ap-northeast-1.compute.internal size=small
clear
ls
kubectl untaint nodes ip-10-0-0-41.ap-northeast-1.compute.internal size=small:NoSchedule-
kubectl taint nodes ip-10-0-0-41.ap-northeast-1.compute.internal size=small:NoSchedule-
kubectl taint nodes ip-10-0-0-41.ap-northeast-1.compute.internal size=small-
kubectl describe node ip-10-0-0-41.ap-northeast-1.compute.internal
kubectl delete -f jenkins.yaml 
kubectl apply -f jenkins.yaml 
kubectl get pods
kubectl describe pods jenkins-7d994b4bcb-5wxlh
kubectl get pods
kubectl taint nodes ip-10-0-0-41.ap-northeast-1.compute.internal size=small:NoSchedule-
kubectl taint nodes ip-10-0-0-41.ap-northeast-1.compute.internal size=small-
kubectl delete -f tomcatingress.yaml 
kubectl delete -f jenkins.yaml 
kubectl apply -f jenkins.yaml 
kubectl get pods
kubectl delete -f tomcat-pod
kubectl get pods
clear
kubectl delete all --all
ls
kubectl get ing
kubectl apply -f jenkins.yaml 
kubectl get pods
kubectl describe pods jenkins-7d994b4bcb-hl24c
kubectl get nodes
kubectl describe nodes ip-10-0-0-230.ap-northeast-1.compute.internal
kubectl taint nodes ip-10-0-0-230.ap-northeast-1.compute.internal size=small:NoSchedule-
kubectl taint nodes ip-10-0-0-230.ap-northeast-1.compute.internal :NoSchedule-
kubectl taint nodes ip-10-0-0-230.ap-northeast-1.compute.internal size=large:NoSchedule-
kubectl taint nodes ip-10-0-0-230.ap-northeast-1.compute.internal color=blue :NoSchedule-
kubectl taint nodes ip-10-0-0-230.ap-northeast-1.compute.internal color=blue:NoSchedule-
claer
clear
kubectl get pods
kubectl describe pods jenkins-7d994b4bcb-hl24c
kubectl delete -f jenkins.yaml 
vi jenkins.yaml 
kubectl apply -f jenkins.yaml 
kubectl get pods
kubectl get ing
kubectl delete -f jenkingress.yaml 
kubectl apply -f jenkingress.yaml 
kubectl get ing
kubectl delete -f jenkingress.yaml 
vi jenkingress.yaml 
cat jenkins.yaml 
vi jenkingress.yaml 
kubectl apply -f jenkingress.yaml 
kubectl get ing
clear
kubectl get ing
kubectl delete -f jenkingress.yaml 
cat jenkins.yaml 
kubectl delete -f jenkingress.yaml 
kubectl apply -f jenkins.yaml 
kubectl delete -f jenkins.yaml 
vi jenkins.yaml 
kubectl apply -f jenkins.yaml 
vi jenkingress.yaml 
kubectl apply -f jenkingress.yaml 
kubectl get ing
clear
kubectl get ing
kubectl get pods
kubectl get all
history
ls
cat ingresstom.yaml 
cat tomcatingress.yaml 
ls
vi jenkins.yaml 
cat jenkins.yaml 
ls
cat jenkingress.yaml 
clear
cat jenkins.yaml 
cd
sudo su -
clear
ls
cat myfirstpod.yaml 
cat devnamespace.yaml 
cat service.yaml 
cat nodeport.yaml 
cat load.yaml 
cat replicaset.yaml 
cat deployment.yaml 
clear
ls
cat deployment.yaml 
clear
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
apt-get update
apt-get install helm
clear
which helm
helm create tomcat
tree tomcat
apt  install tree
tree tomcat
ls
cat deployment.yaml 
ls
tomdep.yaml
vi tomdep.yaml
cat deployment.yaml 
vi tomdep.yaml
helm create jenkins
cd jenkins/
ls
rm -rf charts/
ls
cd templates/
ls
rm - rf *
rm -rf *
ls
cd
ls
cat service.yaml 
cd tomcat/templates/
ls
cd ..
ls
rm -rf charts/
ls
cd templates/
rm -rf *
ls
cp /root/deployment.yaml .
cp /root/service.yaml .
ls
vi deployment.yaml 
vi service.yaml 
cd ..
ls
vi values.yaml 
ls
cd
helm install mytomcat ./tomcat
cd tomcat/templates/
vi deployment.yaml 
vi service.yaml 
cd
helm install mytomcat ./tomcat
helm ls
kubectl get pods
kubectl get svc
helm uninstall mytomcat
helm install mytomcat ./tomcat -n dev-namespace
kubectl get pods -n dev-namespace
kubectl get svc -n dev-namespace
kubectl get svc -n dev-namespace -owide
helm uninstall mytomcat ./tomcat -n dev-namespace
helm ls
clear
helm install mytomcat ./tomcat --set selector_label=sharath
kubectl get pods
kubectl get svc
kubectl get pods tomcat-665b58895b-gtksv -owide
kubectl describe pods tomcat-665b58895b-gtksv 
helm uninstall mytomcat 
ls
cd tomcat/
ls
cd templates/
ls
vi deployment.yaml 
vi service.yaml 
cd ..
vi values.yaml 
cd
helm install mytomcat ./tomcat --dry-run --debug
helm template mytomcat ./tomcat
helm template mytomcat ./tomcat > tomfile.yaml
kubectl apply -f tomfile.yaml 
kubectl get pods
kubectl get svc
kubectl delete -f tomfile.yaml 
kubectl delete -f jenkins
kubectl delete -f jenkins-6d477956b9-7ll2d
clear
kubectl get pods
kubectl rm -f jenkins-6d477956b9-7ll2d
kubectl delete pod jenkins-6d477956b9-7ll2d
clear
vi config.yaml
cd tomcat/
cd templates/
cp /root/config .
cp /root/config.yaml .
ls
cd ..
vi values.yaml 
cd
helm install mytomcat ./tomcat --dry-run --debug
cd tomcat/templates/
ls
vi config.yaml 
cd
helm install mytomcat ./tomcat --dry-run --debug
cd tomcat/
cd templates/
ls
cd ..
vi values.yaml 
cd
helm install mytomcat ./tomcat --dry-run --debug
cd tomcat/
cd templates/
vi values.yaml 
rm -rf values.yaml 
cd ..
vi values.yaml 
cd
helm package ./tomcat 
curl -usharathkj68@gmail.com:Snoofy@13 -T tomcat-0.1.0.tgz "https://sharathkj03.jfrog.io/artifactory/helm/<TARGET_FILE_PATH>"
curl -usharathkj68@gmail.com:Snoofy@13 -T tomcat-0.1.0.tgz "https://sharathkj03.jfrog.io/artifactory/helm/tomcat-0.1.0.tgz"
curl -u sharathkj68@gmail.com:Snoofy@13 -T tomcat-0.1.0.tgz "https://sharathkj03.jfrog.io/artifactory/helm/tomcat-0.1.0.tgz"
curl -ukjsharath5@gmail.com:Snoofy@13 -T tomcat-0.1.0.tgz "https://sharath2021.jfrog.io/artifactory/helm/tomcat-0.1.0.tgz"
clear
helm repo add helm-local https://sharath2021.jfrog.io/artifactory/api/helm/helm-local --username kjsharath5@gmail.com --password Snoofy@13
helm ls
helm repo ls
helm search repo helm/tomcat --versions
helm search repo helm/tomcat 
helm search repo 
cd tomcat/
ls
cd templates/
ls
cd ..
ls
vi Chart.yaml 
cd
helm package ./tomcat 
cd tomcat/
ls
vi Chart.yaml 
cd
helm push tomcat-1.1.1.tgz
helm push tomcat-1.1.1.tgz https://sharath2021.jfrog.io/artifactory/api/helm/helm-local
curl -ukjsharath5@gmail.com:Snoofy@13 -T tomcat-1.1.1.tgz "https://sharath2021.jfrog.io/artifactory/helm/tomcat-1.1.1.tgz"
helm search repo 
helm repo add helm-local https://sharath2021.jfrog.io/artifactory/api/helm/helm-local --username kjsharath5@gmail.com --password Snoofy@13
helm search repo 
clear
helm package ./tomcat 
helm search repo 
clear
helm search repo 
helm repo update
helm search repo 
helm history mytomcat
helm install mytomcat ./tomcat 
helm history mytomcat
helm history mytomcat 1
helm rollback mytomcat 1
helm history mytomcat
helm upgrade mytomcat helm/tomcat --version=0.1.1 --set replicas=2 --set deployment_name=new_tomcat
helm get values mytomcat
helm get values mytomcat --all
clear
useradd -m sharath
passwd sharath
cd /etc/sudoers
cd /etc
ls
vi sudoers
cd
cd /etc/ssh/sshd_config.d/
cd
vi /etc/ssh/sshd_config
su - sharath
cd /etc
vi sudoers
cd
su - sharath
sudo ssh restart
service  ssh restart
su - sharath
vi /etc/ssh/sshd_config
service  ssh restart
vi /etc/group
service  ssh restart
kubectl get nodes
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl get nodes
kubectl get pods
helm uninstall mytomcat
kubectl get pods
su - sharath
cd tomcat/
ls
cd templates/
ls
cd ..
vi values.yaml 
cd
ls
rm -rf hello-world-war/
ls
git clone https://github.com/sharathkj03/hello-world-war.git
cd hello-world-war/
ls
rm -rf helm/
mkdir helm
cd helm
cp -r /root/tomcat .
ls
cd tomcat
ls
cat values.yaml 
cd
cd hello-world-war/
git add .
git status
git commit -m "commiting helm"
git status
git push origin master
cd
cd tomcat/
ls
cd templates/
ls
cat config.yaml 
cat service.yaml 
cat deployment.yaml 
cd ..
cat values.yaml 
cat Chart.yaml 
su - sharath
ls
history
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
kubectl get ing
cd tomcat/
ls
cd templates/
sudo ls
cd
ls
cat ingresstom.yaml 
cat tomcatingress.yaml 
cd tomcat/templates/
cp /root/tomcatingress.yaml .
cat tomcatingress.yaml 
ls
cat tomcatingress.yaml 
vi tomcatingress.yaml 
cd
cat ingresstom.yaml 
cd tomcat/templates/
ls
vi tomcatingress.yaml 
cd
cd ls
cd hello-world-war/
ls
cd helm/
ls
rm -rf tomcat
ls
cp -R /root/tomcat .
ls
cd ..
git add .
git status
git commit -m "comiting tom"
git status
git push origin master
cd
rm -rf hello-world-war/
git clone https://github.com/sharathkj03/hello-world-war.git
cd hello-world-war/
mkdir helm/
cd helm/
ls
cd tomcat/
cp /root/tomcat/templates/tomcatingress.yaml .
ls
rm -rf tomcatingress.yaml 
cd templates/
cp /root/tomcat/templates/tomcatingress.yaml .
ls
cd ../..
cd ..
git add .
git commit -m "comitting"
git status
git push origin master
cd
helm repo add stable https://charts.helm.sh/stable
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm search repo prometheus-community
helm install [RELEASE_NAME] prometheus-community/kube-prometheus-stack
helm install stable prometheus-community/kube-prometheus-stack
kubectl get pods
kubectl get svc
kubectl edit svc stable-kube-prometheus-sta-prometheus
kubectl edit svc stable-grafana
kubectl get svc
kubectl get ep -A
