require 'fastlane/action'
require "fileutils"

require_relative '../helper/download_xcode_templates_helper'

module Fastlane
  module Actions
    class DownloadXcodeTemplatesAction < Action

      def self.run(params)
        repository = params[:repo]

        # Downloading
        downloadHelper = Helper::DownloadXcodeTemplatesHelper.new()
        temp_dir = downloadHelper.get_directory(".tmpTemplates")
        downloadHelper.clean_directory(temp_dir)
        downloadHelper.clone_repository(repository, temp_dir)

        # Moving
        downloadHelper.move_templates("File Templates", temp_dir)
        downloadHelper.move_templates("Project Templates", temp_dir)

        # Cleaning
        downloadHelper.clean_directory(temp_dir)
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
        [
          FastlaneCore::ConfigItem.new(
            key: :repo,
            description: "URL to GIT repository",
            type: String,
            optional: false
          )
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
