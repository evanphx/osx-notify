require 'osx/cocoa'

module OSX
  class Notify < OSX::NSObject
    def self.on(name, &block)
      notify = new()

      notify.block = block

      c = OSX::NSDistributedNotificationCenter.defaultCenter
      c.addObserver_selector_name_object_ notify, "call:", name, nil
    end

    def self.send(name, opts)
      c = OSX::NSDistributedNotificationCenter.defaultCenter
      c.postNotificationName_object_userInfo_deliverImmediately_ name, nil, opts, true
    end

    attr_accessor :block

    def call(notification)
      @block.call(notification.userInfo)
    end
  end
end
