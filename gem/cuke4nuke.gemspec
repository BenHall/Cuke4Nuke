# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cuke4nuke}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Richard Lawrence"]
  s.date = %q{2009-11-13}
  s.default_executable = %q{cuke4nuke}
  s.description = %q{Runs Cucumber with .NET step definitions.}
  s.email = %q{richard@humanizingwork.com}
  s.executables = ["cuke4nuke"]
  s.files = [
    "Rakefile",
     "VERSION",
     "bin/cuke4nuke",
     "cuke4nuke.gemspec",
     "dotnet/Castle.Core.dll",
     "dotnet/Castle.MicroKernel.dll",
     "dotnet/Cuke4Nuke.Core.dll",
     "dotnet/Cuke4Nuke.Framework.dll",
     "dotnet/Cuke4Nuke.Server.exe",
     "dotnet/Cuke4Nuke.Server.exe.config",
     "dotnet/Cuke4Nuke.TestStepDefinitions.dll",
     "dotnet/LitJson.dll",
     "dotnet/NDesk.Options.dll",
     "dotnet/log4net.dll"
  ]
  s.homepage = %q{http://github.com/richardlawrence/Cuke4Nuke}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Cucumber for .NET}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cucumber>, ["= 0.4.3"])
      s.add_runtime_dependency(%q<win32-process>, ["= 0.6.1"])
      s.add_runtime_dependency(%q<systemu>, ["= 1.2.0"])
      s.add_runtime_dependency(%q<json>, ["= 1.2.0"])
    else
      s.add_dependency(%q<cucumber>, ["= 0.4.3"])
      s.add_dependency(%q<win32-process>, ["= 0.6.1"])
      s.add_dependency(%q<systemu>, ["= 1.2.0"])
      s.add_dependency(%q<json>, ["= 1.2.0"])
    end
  else
    s.add_dependency(%q<cucumber>, ["= 0.4.3"])
    s.add_dependency(%q<win32-process>, ["= 0.6.1"])
    s.add_dependency(%q<systemu>, ["= 1.2.0"])
    s.add_dependency(%q<json>, ["= 1.2.0"])
  end
end

