require "devise"
require 'adminlte-rails'
require 'dragonfly'
require 'pundit'
module Foswipe
  class Engine < ::Rails::Engine
    isolate_namespace Foswipe
    config.to_prepare do
      Devise::SessionsController.layout "foswipe/devise"
      Devise::RegistrationsController.layout "foswipe/devise"
    end
  end
end
