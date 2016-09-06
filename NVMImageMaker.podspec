Pod::Spec.new do |s|
  s.name             = "NVMImageMaker"
  s.version          = "0.1.1"
  s.summary          = "API for chaining image drawing codes."
  s.description      = <<-DESC
                        Chaining your image drawing codes together in Objective-C.
                       DESC

  s.homepage         = "https://github.com/eleme/NVMImageMaker"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "axl411" => "axl411511@live.com" }
  s.source           = { :git => "https://github.com/eleme/NVMImageMaker.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end
