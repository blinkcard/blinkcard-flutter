#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint BlinkCardFlutter.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'blinkcard_flutter'
  s.version          = '2.4.1'
  s.summary          = 'Flutter plugin for BlinkCard, SDK for scanning and OCR of various credit cards.'
  s.description      = <<-DESC
Flutter plugin for BlinkCard, SDK for scanning and OCR of various credit cards.
                       DESC
  s.homepage         = 'https://github.com/blinkcard/blinkcard-flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Microblink' => 'https://help.microblink.com/hc/en-us' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  s.dependency 'MBBlinkCard', '~> 2.4.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
