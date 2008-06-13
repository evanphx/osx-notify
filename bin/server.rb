require 'osx-notify'

OSX::NSApplication.sharedApplication

which = OSX::Notify.on "TestNotify" do |opts|
  p opts[:reason]
end


OSX::NSApp.run
