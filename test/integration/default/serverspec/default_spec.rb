# coding: UTF-8

require 'spec_helper'

describe 'tcpdump_service' do
  it 'exists and is currently stopped' do
    cmd = command 'service tcpdump status'
    expect(cmd.exit_status).to eq 3
  end

  it 'created the log directory' do
    expect(file '/var/log/tcpdump/current').to be_file
  end

  it 'logged the request to nist' do
    expect(file '/var/log/tcpdump/current').to contain('beacon.nist.gov.https')
  end
end
