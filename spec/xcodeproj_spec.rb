# frozen_string_literal: true

require File.expand_path("../spec_helper", __FILE__)

module Danger
  describe Danger::DangerXcodeproj do
    it "should be a plugin" do
      expect(Danger::DangerXcodeproj.new(nil)).to be_a Danger::Plugin
    end

    #
    # You should test your custom attributes and methods here
    #
    describe "with Dangerfile" do
      before do
        @dangerfile = testing_dangerfile
        @my_plugin = @dangerfile.xcodeproj
      end

      it "Open Xcode project file" do

        @my_plugin.open('spec/fixtures/danger-xcodeproj/danger-xcodeproj.xcodeproj')
        expect(@my_plugin.project).to_not be_nil
      end

      it "Targets exists in opened project" do

        @my_plugin.open('spec/fixtures/danger-xcodeproj/danger-xcodeproj.xcodeproj')
        expect(@my_plugin.project).to_not be_nil
        expect(@my_plugin.targets).to_not be_nil
      end

      it "Target Attributes exists in opened project" do

        @my_plugin.open('spec/fixtures/danger-xcodeproj/danger-xcodeproj.xcodeproj')
        expect(@my_plugin.project).to_not be_nil
        expect(@my_plugin.target_attributes).to_not be_nil
      end

    end
  end
end
