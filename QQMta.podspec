Pod::Spec.new do |s|

  s.name                  = 'QQMta'
  s.version               = '2.0.8'
  s.summary               = '专业的移动应用数据分析能力，为您的应用提供实时数据统计分析服务，监控版本质量、渠道状况、用户画像属性及用户细分行为，通过数据可视化展现，协助产品运营决策。'
  s.homepage              = 'http://mta.qq.com'
  s.authors               = { 'derekibw' => 'https://github.com/derekibw' }
  s.source                = { :git => 'https://github.com/derekibw/QQMta.git', :tag => s.version }
  s.license               = 'None'
  s.requires_arc          = true
  s.ios.deployment_target = '6.0'
  s.platform              = :ios
  s.default_subspecs      = 'Core'

  s.subspec 'Core' do |ss|
    ss.source_files         = 'SDK/*.h'
    ss.public_header_files  = 'SDK/*.h'
    ss.vendored_library     = 'SDK/libmtasdk.a'
    ss.frameworks           = 'UIKit', 'Foundation', 'QuartzCore', 'CoreGraphics', 'CoreTelephony', 'CFNetwork', 'Security', 'SystemConfiguration'
    ss.libraries            = 'z', 'sqlite3'
  end

  s.subspec 'AutoTrack' do |ss|
    ss.dependency         'QQMta/Core'
    ss.vendored_library = 'SDK/plugin/autotrack/libautotrack.a'
  end

  s.subspec 'IDFA' do |ss|
    ss.dependency         'QQMta/Core'
    ss.vendored_library = 'SDK/plugin/idfa/libidfa.a'
    ss.frameworks       = 'AdSupport'
  end

  s.subspec 'InstallTracker' do |ss|
    ss.dependency             'QQMta/Core'
    ss.source_files         = 'SDK/plugin/installtracker/*.h'
    ss.public_header_files  = 'SDK/plugin/installtracker/*.h'
    ss.vendored_library     = 'SDK/plugin/installtracker/libidfa.a'
    ss.frameworks           = 'AdSupport'
  end

end
