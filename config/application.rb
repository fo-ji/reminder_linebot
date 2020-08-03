require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ReminderLinebot
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    #自作ファイルが上手く読み込まれなかった為、手動で追加
    config.autoload_paths += %W(#{config.root}/app/controllers/services)
    config.autoload_paths += %W(#{config.root}/lib)
  end
end
