# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( election.png )
Rails.application.config.assets.precompile += %w( artist2.png )
Rails.application.config.assets.precompile += %w( theater5.png )

Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "images")

Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "javascripts")

Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music", "eps")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music", "png")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music", "psd")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music", "svg")

Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music-and-sound-1")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music-and-sound-1", "eps")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music-and-sound-1", "png")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music-and-sound-1", "psd")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music-and-sound-1", "svg")

Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music-and-sound-2")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music-and-sound-2", "eps")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music-and-sound-2", "png")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music-and-sound-2", "psd")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "music-and-sound-2", "svg")

Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "pinup")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "pinup", "eps")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "pinup", "png")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "pinup", "psd")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets", "pinup", "svg")
