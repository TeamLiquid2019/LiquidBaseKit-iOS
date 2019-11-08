#
# Be sure to run `pod lib lint LiquidBaseKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LiquidBaseKit'
  s.version          = '0.0.2'
  s.summary          = 'BaseKit for TeamLiquid.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  iOS项目基础组件库，提供宏定义，网络请求，RSA加密，数据库等基础服务（业务无关）.
                       DESC

  s.homepage         = 'https://github.com/TeamLiquid2019/LiquidBaseKit-iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'TeamLiquid2019' => 'liquid@teamliquid.com.cn' }
  s.source           = { :git => 'https://github.com/TeamLiquid2019/LiquidBaseKit-iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LiquidBaseKit/Classes/*'
  
  # s.resource_bundles = {
  #   'LiquidBaseKit' => ['LiquidBaseKit/Assets/*.png']
  # }
  
  s.public_header_files = 'LiquidBaseKit/Classes/LiquidBaseKit.h'
  
  #-----------------文件分级-------------------#
  
#  s.subspec 'Macro' do |ss|
#    ss.source_files = 'LiquidBaseKit/Classes/Macro/*.{h,m}'
#  end
  
  s.subspec 'Util' do |ss|
    ss.source_files = 'LiquidBaseKit/Classes/Util/*.{h,m}'
#    ss.dependency 'LiquidBaseKit/Macro'
  end
  
  s.subspec 'RSA' do |ss|
    ss.source_files = 'LiquidBaseKit/Classes/RSA/*.{h,m}'
  end
  
  s.subspec 'Networking' do |ss|
    ss.source_files = 'LiquidBaseKit/Classes/Networking/*.{h,m}'
#    ss.dependency 'LiquidBaseKit/Macro'
    ss.dependency 'LiquidBaseKit/RSA'
    ss.dependency 'LiquidBaseKit/Util'
  end
  
  s.subspec 'DB' do |ss|
    ss.source_files = 'LiquidBaseKit/Classes/DB/*.{h,m}'
  end
  
  #-----------------文件分级结束-------------------#
  
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.dependency 'YYKit'
  s.dependency 'AFNetworking','~> 3.2.1'
  s.dependency 'ReactiveObjC','~> 3.1.0'
  s.dependency 'OpenSSL-for-iOS', '~> 1.0.2.d.1'
  s.dependency 'FMDB'
  
end
