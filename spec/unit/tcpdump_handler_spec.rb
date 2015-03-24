# coding: UTF-8

require_relative '../spec_helper'

describe 'ops_tcpdump_handler' do
  subject { ChefSpec::SoloRunner.new(platform: 'centos', version: '6.6').converge(described_recipe) }

  it { is_expected.to install_package('tcpdump') }
  it { is_expected.to include_recipe('runit::default') }
  it { is_expected.to enable_runit_service('tcpdump') }

end
