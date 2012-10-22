# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require "motion/project"
require "bundler"
Bundler.require

require "#{Dir.pwd}/tasks/generators"

Motion::Project::App.setup do |app|
  extensions = File.join(app.project_dir, "app/extensions/*.rb")

  app.name = "tweets-i-love"
  app.identifier = "com.malkomalko.tweets-i-love"
  app.version = "1.0.0"
  app.deployment_target = "5.0"
  app.interface_orientations = [:portrait]

  app.files.unshift(Dir.glob(extensions))

  app.libs += ["/usr/lib/libz.dylib", "/usr/lib/libsqlite3.dylib"]

  app.frameworks += [
    "Accelerate",
    "Accounts",
    "AssetsLibrary",
    "ImageIO",
    "MobileCoreServices",
    "QuartzCore"
  ]

  app.pods do
    pod "NanoStore", "~> 2.1.4"
  end
end
