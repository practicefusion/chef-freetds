require 'serverspec'

set :backend, :exec

describe 'freetds::default' do
  describe file('/etc/freetds/freetds.conf') do
    it { should be_file }
  end

  describe command('which tsql') do
    its(:stdout) { should match '/usr/bin/tsql' }
    its(:exit_status) { should eq 0 }
  end

  describe command('tsql -C') do
    its(:stdout) { should match 'Version: freetds v0.91' }
    its(:stdout) { should match 'TDS version: 4.2' } # compile time option
    its(:exit_status) { should eq 0 }
  end
end
