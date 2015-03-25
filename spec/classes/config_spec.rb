require 'spec_helper'


describe 'tdd_puppet_module' do
  let(:facts) { {:osfamily => 'Debian'} }

  it do
    should contain_file('/etc/example_config_file.cfg').with(
      ensure: 'present',
      owner:  'www-data',
      group:  'root',
      mode:  '0755',
    )
  end
end
