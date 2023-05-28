source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '12.0'
use_frameworks!

target 'Test' do
  pod 'Kingfisher'
  pod 'Airship'
  pod 'Toast-Swift', '~> 5.0.1'
end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CODE_SIGN_IDENTITY'] = ''
         end
    end
  end
end
