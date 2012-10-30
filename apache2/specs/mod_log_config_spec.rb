require 'minitest/spec'

describe_recipe 'apache2::mod_log_config' do
  include MiniTest::Chef::Resources
  include MiniTest::Chef::Assertions

  it 'enables mod_log_config for RHEL systems' do
    if %w{centos redhat fedora amazon}.include?(node[:platform])
      link("#{node[:apache][:dir]}/mods-enabled/log_config.load").must_exist.with(
           :link_type, :symbolic).and(:to, "#{node[:apache][:dir]}/mods-available/log_config.load")
    end
  end
end
