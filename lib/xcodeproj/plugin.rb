# frozen_string_literal: true

require 'xcodeproj'

module Danger
  # This is your plugin class. Any attributes or methods you expose here will
  # be available from within your Dangerfile.
  #
  # To be published on the Danger plugins site, you will need to have
  # the public interface documented. Danger uses [YARD](http://yardoc.org/)
  # for generating documentation from your plugin source, and you can verify
  # by running `danger plugins lint` or `bundle exec rake spec`.
  #
  # You should replace these comments with a public description of your library.
  #
  # @example Ensure people are well warned about merging on Mondays
  #
  #          my_plugin.warn_on_mondays
  #
  # @see  Manoj/danger-xcodeproj
  # @tags monday, weekends, time, rattata
  #
  class DangerXcodeproj < Plugin

    # Xcode project object
    # @return  [Project] Xcode project object
    attr_accessor :project

    # Opens Xcode project file using the given path
    #
    # @return  [void]
    #
    def open(path=nil)
      # Fails if Xcode project file path is not provided
      raise "Xcode project file path in not set!" unless !path.nil?

      @project = Xcodeproj::Project.open(path)
    end

    # Targets in Xcode Project file
    #
    # @return   [Array<Target>]
    #
    def targets
      raise "Xcode project is not opened!" if @project.nil?

      @project.targets
    end
    
    # Targets Attributes in Xcode Project file
    #
    # @return   [Array<TargetAttributes>]
    #
    def target_attributes
      raise "Xcode project is not opened!" if project.nil?
      
      @project.root_object.attributes["TargetAttributes"]
    end
  end
end
