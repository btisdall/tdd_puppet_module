require 'spec_helper'

describe 'tdd_puppet_module' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        case facts[:osfamily]
        when 'Debian'
          it do
            should contain_file('/etc/tdd_puppet_module.cfg').with(
              :ensure => 'present',
              :owner  => 'adm',
              :group  => 'root',
              :mode   => '0755',
            )
          end
        when 'RedHat'
          it do
            should contain_file('/etc/tdd_puppet_module.conf').with({
              :ensure => 'present',
              :owner  => 'adm',
              :group  => 'root',
              :mode   => '0755',
            })
          end
        end
      end
    end
  end
end
