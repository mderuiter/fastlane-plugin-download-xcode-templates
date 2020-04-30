require 'fastlane_core/ui/ui'
require "fileutils"
require 'tmpdir'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class DownloadXcodeTemplatesHelper

      TEMPLATES_DIR = Pathname.new(ENV['HOME']+"/Library/Developer/Xcode/Templates/")

      def clone_repository(repo, directory)
        unless system("git clone -b master #{repo} #{directory}")
          UI.crash!("Failed to clone repository")
        end
      end

      def get_directory(name)
        cur_dir = Pathname.new(Dir.pwd)
        temp_dir = cur_dir.join(name)
      end

      def clean_directory(directory)
        FileUtils.remove_dir(directory) if Dir.exist?(directory)
      end

      def move_templates(path, source)
        UI.message("Moving #{path} ...")

        source_dir = source.join(path)
        destination_dir = TEMPLATES_DIR.join(path)

        if Dir.exist?(source_dir)
          FileUtils.mkdir(destination_dir) unless Dir.exist?(destination_dir)
          move_directories(source_dir, destination_dir)
        else
          UI.message("Directory for '#{path}' not found. Skipping this step.")
        end
      end

      private

      def move_directories(source, destination)
        Dir.foreach(source) do |name|
          next if name == "." || name == ".."

          source_dir = source.join(name)
          destination_dir = destination.join(name)
          clean_directory(destination_dir)
          FileUtils.mv(source_dir, destination_dir)
          UI.message("- #{destination_dir}")
        end
      end

    end
  end
end
