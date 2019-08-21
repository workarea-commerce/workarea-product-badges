module Workarea
  module ProductBadges
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::ProductBadges
    end
  end
end
