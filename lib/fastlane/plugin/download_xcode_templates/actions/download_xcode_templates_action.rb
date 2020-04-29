require 'fastlane/action'
require_relative '../helper/download_xcode_templates_helper'

module Fastlane
  module Actions
    class DownloadXcodeTemplatesAction < Action
      def self.run(params)
        UI.message("The download_xcode_templates plugin is working!")
      end

      def self.description
        "Download Xcode templates"
      end

      def self.authors
        ["Milan de Ruiter"]
      end

      def self.details
        "Download Xcode templates from a git repository"
      end

      def self.available_options
        []
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
