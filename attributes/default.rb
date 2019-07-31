


default[:kube][:minikube][:version] = '1.2.0'
default[:kube][:minikube][:checksum] = '183d017d094b7783c938dc709dbdfc9a48f92299178234f89047dfbb083a592c'
default[:kube][:minikube][:base_directory] = '/usr/local/kubernetes/minikube'

default[:kube][:kubectl][:version] = '1.15.1'
default[:kube][:kubectl][:checksum] = '7d988cd758b8f46721430454f2cc94d511112f183a5ebab9a84a8a8f1d14b36d'
default[:kube][:kubectl][:base_directory] = '/usr/local/kubernetes/kubectl'

default[:kube][:helm][:version] = '2.14.3'
default[:kube][:helm][:checksum] = '9469da75bb357bc325c985dead224480bbacc7aa8aecff74089dff97e64655d0'
default[:kube][:helm][:base_directory] = '/usr/local/kubernetes/helm'
