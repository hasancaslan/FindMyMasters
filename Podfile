# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'MastersPortal' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MastersPortal
  # autolayout
  pod 'SnapKit'

  # activity indicator
  pod 'JGProgressHUD'
  pod 'PKHUD'

  # custom UI
  pod 'Cards'
  pod 'SwiftMessages'
  pod 'BulletinBoard'

  # animations
  pod 'ViewAnimator'

  # Data
  pod 'SQLite.swift'
  pod 'IGListKit'

  # Debug
  pod 'FLEX', :configurations => ['Debug']

end

post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end