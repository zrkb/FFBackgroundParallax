#
#  Be sure to run `pod spec lint FFBackgroundParallax.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "FFBackgroundParallax"
  s.version      = "1.1.0"
  s.summary      = "Background Parallax is a simple example for parallax scrolling based on several UIScrollViews."

  s.description  = <<-DESC
                   Background Parallax is a simple example for parallax scrolling based on several UIScrollViews. This library is simply a UIView subclass with two UIScrollView, one for content and the second for the background image.

                   DESC

  s.homepage     = "https://github.com/rockbarato/FFBackgroundParallax"

  s.license      = "MIT"

  s.author             = { "Felix Ayala" => "felix1262@gmail.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/rockbarato/FFBackgroundParallax.git", :tag => "1.1.0" }
  s.source_files  = "FFBackgroundParallax/FFBackgroundParallax.{h,m}"

  s.requires_arc = true

end
