describe Fastlane::Actions::DownloadXcodeTemplatesAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The download_xcode_templates plugin is working!")

      Fastlane::Actions::DownloadXcodeTemplatesAction.run(nil)
    end
  end
end
