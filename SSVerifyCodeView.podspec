#
# Be sure to run `pod lib lint SSVerifyCodeView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SSVerifyCodeView'
  s.version          = '0.1.3'
  s.summary          = '验证码,短信一键导入，支付密码'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
验证码,短信一键导入，支付密码等
                       DESC

  s.homepage         = 'https://github.com/sspAppTeam/SSVerifyCodeView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SSPSource' => '2316585240@qq.com' }
  s.source           = { :git => 'https://github.com/sspAppTeam/SSVerifyCodeView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SSVerifyCodeView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SSVerifyCodeView' => ['SSVerifyCodeView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'Masonry'
end
