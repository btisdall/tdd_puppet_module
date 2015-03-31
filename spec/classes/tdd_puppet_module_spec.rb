require 'spec_helper'

describe 'tdd_puppet_module' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "tdd_puppet_module class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('tdd_puppet_module::params') }
          it { is_expected.to contain_class('tdd_puppet_module::repos').that_comes_before('tdd_puppet_module::install') }
          it { is_expected.to contain_class('tdd_puppet_module::install').that_comes_before('tdd_puppet_module::config') }
          it { is_expected.to contain_class('tdd_puppet_module::config') }
          it { is_expected.to contain_class('tdd_puppet_module::service').that_subscribes_to('tdd_puppet_module::config') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'tdd_puppet_module class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('tdd_puppet_module') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
