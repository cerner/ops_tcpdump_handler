# coding: UTF-8

require_relative '../spec_helper'

describe 'ops_tcpdump_handler' do
  subject { ChefSpec::SoloRunner.new(platform: 'centos', version: '6.6').converge(described_recipe) }

  before do
    allow(File).to receive(:exist?).with(anything).and_call_original
  end

  it { is_expected.to install_package('tcpdump') }
  it { is_expected.to include_recipe('runit::default') }
  it { is_expected.to enable_runit_service('tcpdump') }

  context 'first run' do
    before(:each) do
      allow(File).to receive(:exist?).with('/var/log/tcpdump/current').and_return(false)
    end
    it { is_expected.to_not run_execute('echo "" > /var/log/tcpdump/current') }
  end

  context 'subsequent runs' do
    before(:each) do
      allow(File).to receive(:exist?).with('/var/log/tcpdump/current').and_return(true)
    end
    it { is_expected.to run_execute('echo "" > /var/log/tcpdump/current') }
  end
end
