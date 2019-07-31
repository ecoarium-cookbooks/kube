#
# Cookbook Name:: kube
# Recipe:: helm
#

download_url = "https://get.helm.sh/helm-v#{node[:kube][:helm][:version]}-darwin-amd64.tar.gz"

helm_directory = "#{node[:kube][:helm][:base_directory]}/#{node[:kube][:helm][:version]}"
helm_file_path = "#{helm_directory}/helm"

directory helm_directory do
  owner ENV['USER']
  recursive true
end

remote_file helm_file_path do
  source download_url
  mode '0755'
  owner ENV['USER']
  checksum node[:kube][:helm][:checksum]
end

link '/usr/local/bin/helm' do
  to helm_file_path
end
