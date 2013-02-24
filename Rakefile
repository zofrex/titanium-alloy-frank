SOURCE_FILES = FileList["app", "manifest", "plugins", "Resources", "tiapp.xml"]
IOS_BUILD_PATH = "build/iphone/"

file IOS_BUILD_PATH => SOURCE_FILES do
  sh "titanium build --build-only --platform ios" do |ok|
      fail "Failed to create XCode project" if !ok
  end
  touch IOS_BUILD_PATH
end

task :create_xcode_project => IOS_BUILD_PATH
