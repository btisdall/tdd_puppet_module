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
            it { is_expected.to contain_package('fortune').with_ensure('present') }
        when 'RedHat'
            it { is_expected.to contain_package('cowsay').with_ensure('present') }
        end
      end
    end
  end
end
