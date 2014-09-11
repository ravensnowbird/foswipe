require "devise"
require 'adminlte-rails'
require 'dragonfly'
module Foswipe
  class Engine < ::Rails::Engine
    isolate_namespace Foswipe
  end
end
