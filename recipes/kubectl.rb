#
# Cookbook Name:: kube
# Recipe:: kubectl
#

download_url = "https://storage.googleapis.com/kubernetes-release/release/v#{node[:kube][:kubectl][:version]}/bin/darwin/amd64/kubectl"

kubectl_directory = "#{node[:kube][:kubectl][:base_directory]}/#{node[:kube][:kubectl][:version]}"
kubectl_file_path = "#{kubectl_directory}/kubectl"

directory kubectl_directory do
  owner ENV['USER']
  recursive true
end

remote_file kubectl_file_path do
  source download_url
  mode '0755'
  owner ENV['USER']
  checksum node[:kube][:kubectl][:checksum]
end

link '/usr/local/bin/kubectl' do
  to kubectl_file_path
end
