require 'xcodeproj'
require 'sim_launcher'

PROJECT_ROOT = File.expand_path File.dirname(__FILE__)
SOURCE_FILES = FileList["app", "manifest", "plugins", "Resources", "tiapp.xml"]
FRANK_FILES = File.join(PROJECT_ROOT, "Frank")
IOS_BUILD_PATH = "build/iphone/"
X_PROJ_PATH = "build/iphone/Lemonade.xcodeproj"
X_TARGET_NAME = "Lemonade"
X_BUILD_CONFIG = "Debug"
X_APP_PATH = File.join(IOS_BUILD_PATH, "build", "#{X_BUILD_CONFIG}-iphonesimulator", "#{X_TARGET_NAME}.app")
X_BINARY_PATH = File.join(X_APP_PATH, X_TARGET_NAME)
X_FRANK_SETTINGS = {
  "OTHER_LDFLAGS" => "$(FRANK_LDFLAGS)",
  "LIBRARY_SEARCH_PATHS" => FRANK_FILES
}
X_FRANK_BUNDLE = "frank_static_resources.bundle"
X_FRANK_BUNDLE_SRC = File.join(FRANK_FILES, X_FRANK_BUNDLE)
X_FRANK_BUNDLE_DST = File.join(X_APP_PATH, X_FRANK_BUNDLE)
X_FRANK_CONFIG = File.join(FRANK_FILES, "frankify.xcconfig")
FRANK_STAMP = File.join(IOS_BUILD_PATH, ".franked")

# Re-build XCode project when source files change
file IOS_BUILD_PATH => SOURCE_FILES do
  sh "titanium build --build-only --platform ios" do |ok|
      fail "Failed to create XCode project" if !ok
  end
  touch IOS_BUILD_PATH
end
task :create_xcode => IOS_BUILD_PATH

# Add Frank support to XCode project
file FRANK_STAMP => IOS_BUILD_PATH do
  project = Xcodeproj::Project.new(X_PROJ_PATH)
  target = project.targets.select {|t| t.name == X_TARGET_NAME }.first
  settings = target.build_configuration_list.build_settings(X_BUILD_CONFIG)
  X_FRANK_SETTINGS.each do |setting, entry|
    entries = settings[setting] ||= []
    entries.unshift "$(inherited)"
    entries << entry
    entries.uniq!
  end
  project.save_as(X_PROJ_PATH)
  touch FRANK_STAMP
  puts "Franked!"
end

# Copy Frank's file bundle over
file X_FRANK_BUNDLE_DST => X_FRANK_BUNDLE_SRC do
  cp_r X_FRANK_BUNDLE_SRC, X_APP_PATH
  puts "Copied"
end

# Compile the iOS version
file X_BINARY_PATH => [FRANK_STAMP, X_FRANK_BUNDLE_DST] do
  cd IOS_BUILD_PATH do
    sh "xcodebuild -xcconfig #{X_FRANK_CONFIG} build -target #{X_TARGET_NAME} -configuration #{X_BUILD_CONFIG} -sdk iphonesimulator"
  end
end
task :compile => X_BINARY_PATH

task :launch => :compile do
  SimLauncher::DirectClient.for_iphone_app(X_APP_PATH).relaunch
  puts "Launched!"
end

task :inspect do
  sh 'open http://localhost:37265'
end
