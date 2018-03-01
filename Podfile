# Uncomment this line to define a global platform for your project

platform :ios, '9.1‘
use_frameworks!

target 'TestGitHubProject' do
  pod 'ObjectMapper'
  pod 'RxAlamofire'
  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa',    '~> 4.0'
end

target 'TestGitHubProjectTests‘ do
  pod 'RxTest’
  pod 'ObjectMapper'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'            
        end
    end
end