#
# Cookbook Name:: kube
# Recipe:: minikube
#

include_recipe 'kube::kubectl'

download_url = "https://storage.googleapis.com/minikube/releases/v#{node[:kube][:minikube][:version]}/minikube-darwin-amd64"

minikube_directory = "#{node[:kube][:minikube][:base_directory]}/#{node[:kube][:minikube][:version]}"
minikube_file_path = "#{minikube_directory}/minikube"

directory minikube_directory do
  owner ENV['USER']
  recursive true
end

remote_file minikube_file_path do
  source download_url
  mode '0755'
  owner ENV['USER']
  checksum node[:kube][:minikube][:checksum]
end

link '/usr/local/bin/minikube' do
  to minikube_file_path
end
