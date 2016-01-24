# coding: UTF-8

require 'chef/log'
require 'chef/handler'
require 'mixlib/shellout'

module TcpdumpHandler
  # Chef Handler for reading a tcpdump and outputing the contents
  class Tcpdump < Chef::Handler
    def report
      connections = {}
      stop_service = Mixlib::ShellOut.new('service tcpdump stop')
      stop_service.run_command.error!
      File.readlines('/var/log/tcpdump/current').each do |line|
        destination = line[/\> (.+\.)(\D+):/, 1]
        proto = line[/\> (.+\.)(\D+):/, 2]
        connections[destination] = proto if destination
      end
      connections.each do |destination, proto|
        puts "attempted to connect to: #{destination.chop} using #{proto}"
      end
    end
  end
end

Chef::Config[:report_handlers] << TcpdumpHandler::Tcpdump.new
