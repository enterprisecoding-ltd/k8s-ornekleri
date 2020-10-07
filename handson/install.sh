#!/bin/bash
clear
cat << "EOF"
==================================================================================
   ______       _                       _                        _ _
  |  ____|     | |                     (_)                      | (_)
  | |__   _ __ | |_ ___ _ __ _ __  _ __ _ ___  ___  ___ ___   __| |_ _ __   __ _
  |  __| | '_ \| __/ _ \ '__| '_ \| '__| / __|/ _ \/ __/ _ \ / _` | | '_ \ / _` |
  | |____| | | | ||  __/ |  | |_) | |  | \__ \  __/ (_| (_) | (_| | | | | | (_| |
  |______|_| |_|\__\___|_|  | .__/|_|  |_|___/\___|\___\___/ \__,_|_|_| |_|\__, |
                            | |                                             __/ |
                            |_|                                            |___/
===================================================================================

Kubernetes handson sınav ortamı kullanıma hazırlanıyor lütfen bekleyiniz
EOF

kubectl create -f https://raw.githubusercontent.com/enterprisecoding-ltd/k8s-ornekleri/master/handson/handson-install.yaml

while [[ $(kubectl get pods -n handson -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True True" ]]; do printf "." && sleep 1; done

APP_NODE_PORT=$(kubectl get services kubernetes-handson -n handson  -o=jsonpath='{.spec.ports[0].nodePort}')

echo ""
echo "Kubernetes handson sınav ortamı kullanıma hazır."
echo "Uygulama erişim portu : $APP_NODE_PORT"
echo "başarılar..."