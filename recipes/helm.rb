#
# Cookbook Name:: kube
# Recipe:: helm
#

download_url = "https://get.helm.sh/helm-v#{node[:kube][:helm][:version]}-darwin-amd64.tar.gz"

helm_directory = "#{node[:kube][:helm][:base_directory]}/#{node[:kube][:helm][:version]}"
helm_file_path = "#{helm_directory}/darwin-amd64/helm"

directory helm_directory do
  owner ENV['USER']
  recursive true
end

tar_extract download_url do
  target_dir helm_directory
  creates helm_file_path
  user ENV['USER']
  checksum node[:kube][:helm][:checksum]
end

link '/usr/local/bin/helm' do
  to helm_file_path
end
