#
# Be sure to run `pod lib lint Utilites.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Utilites'
  s.version          = '0.5.3'
  s.summary          = 'Awesome Utilites.'

  s.description      = <<-DESC
Uitls of eveything !
                       DESC

  s.homepage         = 'https://github.com/jprothwell/Utilites'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Leon' => 'jprothwell@gmail.com' }
  s.source           = { :git => 'https://github.com/jprothwell/Utilites.git', :tag => s.version.to_s }

  s.platform = :ios, '11.0'
  s.swift_version = '4.2'
  s.source_files = 'Utilites/Classes/**/*'
  
  s.subspec 'Core' do |ss|
    ss.source_files = 'Utilites/Classes/Utilites.swift'
  end
  
  s.subspec 'UIView' do |ss|
    ss.source_files = 'Utilites/Classes/UIViewX.swift'
  end
  
  s.subspec 'UIDevice' do |ss|
    ss.source_files = 'Utilites/Classes/UIDeviceX.swift'
  end
  
  s.subspec 'UITabBarController' do |ss|
    ss.source_files = 'Utilites/Classes/UITabBarControllerX.swift'
  end
  
  s.subspec 'UITabBar' do |ss|
    ss.source_files = 'Utilites/Classes/UITabBarX.swift'
  end
  
  s.subspec 'UINavigationBar' do |ss|
    ss.source_files = 'Utilites/Classes/UINavigationBarX.swift'
  end
  
  s.subspec 'UITableViewCell' do |ss|
    ss.source_files = 'Utilites/Classes/UITableViewCellX.swift'
    ss.dependency 'Utilites/UIView'
  end
  
  s.subspec 'UIImage' do |ss|
    ss.source_files = 'Utilites/Classes/UIImageX.swift'
  end
  
  s.subspec 'PixelLayoutConstraint' do |ss|
    ss.source_files = 'Utilites/Classes/PixelLayoutConstraint.swift'
  end
end
