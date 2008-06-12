require 'osx-notify'

OSX::Notify.on "TestNotify" do |opts|
  p opts[:reason]
end


OSX::NSApp.run
