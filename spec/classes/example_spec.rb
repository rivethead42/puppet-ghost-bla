require 'spec_helper'

describe 'ghost' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "ghost class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('ghost::params') }
          it { is_expected.to contain_class('ghost::install').that_comes_before('ghost::config') }
          it { is_expected.to contain_class('ghost::config') }
          it { is_expected.to contain_class('ghost::service').that_subscribes_to('ghost::config') }

          it { is_expected.to contain_service('ghost') }
          it { is_expected.to contain_package('ghost').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'ghost class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('ghost') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
