Pod::Spec.new do |s|

  s.name                  = 'TencentMta'
  s.version               = '2.0.5'
  s.summary               = '专业的移动应用数据分析能力，为您的应用提供实时数据统计分析服务，监控版本质量、渠道状况、用户画像属性及用户细分行为，通过数据可视化展现，协助产品运营决策。'
  s.homepage              = 'http://mta.qq.com'
  s.authors               = { 'Sunnyyoung' => 'https://github.com/derekibw' }
  s.source                = { :git => 'https://github.com/derekibw/TencentMta.git', :tag => s.version }
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
    ss.dependency         'TencentMta/Core'
    ss.vendored_library = 'SDK/libautotrack.a'
  end

  s.subspec 'IDFA' do |ss|
    ss.dependency         'TencentMta/Core'
    ss.vendored_library = 'SDK/libidfa.a'
    ss.frameworks       = 'AdSupport'
  end

end
