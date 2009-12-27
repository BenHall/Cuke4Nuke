#!/usr/bin/env ruby

require 'rubygems'
require 'systemu'
begin 
  require 'win32/process'
rescue LoadError
  $stderr.puts 'Failed to load win32/process'
end

module Cuke4Nuke
  class Main
    def run(args)
      if args.empty? || ['-h', '-?', '/?', '--help'].include?(args[0])
        show_usage
      else
        step_definitions_dll_path = File.expand_path(args.shift)

        if !File.file?(step_definitions_dll_path)
          puts %{"#{step_definitions_dll_path}" is not a valid file path.\n\n}
          show_usage
          exit 1
        end

        launch_cuke4nuke_process(step_definitions_dll_path)

        @exit_status = 1
        begin
          cucumber_status = launch_cucumber(args)
          @exit_status = cucumber_status.exitstatus
        ensure
          kill_cuke4nuke_process
        end
        exit @exit_status
      end
    end

    def launch_cuke4nuke_process(step_definitions_dll_path)
      command = %{"#{cuke4nuke_server_exe}" -a "#{step_definitions_dll_path}"}
      process = IO.popen(command, 'r')
      @cuke4nuke_server_pid = process.pid
    end

    def cuke4nuke_server_exe()
      exe = File.expand_path(File.join(File.dirname(__FILE__), '../../dotnet/Cuke4Nuke.Server.exe'))
      exe = %{"mono #{exe}"} if running_on_osx? && mono_installed?
      return exe
    end
	
    def running_on_osx?()
      RUBY_PLATFORM =~ /darwin/ 
    end
	
    def mono_installed?()
      system('which mono >> /dev/null')
    end

    def kill_cuke4nuke_process
      Process.kill(9, @cuke4nuke_server_pid)
    end

    def launch_cucumber(args)
      command = "cucumber #{args.join(' ')} 2>&1"
      status, stdout, stderr = systemu(command)
      puts stdout
      status
    end

    def show_usage
      puts "Usage: cuke4nuke STEP_DEFINITION_DLL_PATH [CUCUMBER_ARGUMENTS]\n\n"
      puts "The following is Cucumber's help. Anything after the cucumber command can be"
      puts "passed in the CUCUMBER_ARGUMENTS argument for cuke4nuke:\n\n"
      launch_cucumber(['--help'])
    end
  end
end
