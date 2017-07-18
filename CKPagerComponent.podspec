#
# Be sure to run `pod lib lint CKPagerComponent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CKPagerComponent'
  s.version          = '1.0.0'
  s.summary          = 'CKPagerComponent.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "CKPagerComponent.pageManager"

  s.homepage         = 'https://github.com/CorkiiOS/CKPagerComponent'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'corkiios' => '675053587@qq.com' }
  s.source           = { :git => 'https://github.com/CorkiiOS/CKPagerComponent.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'CKPagerComponent/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CKPagerComponent' => ['CKPagerComponent/Assets/*.png']
  # }


end
