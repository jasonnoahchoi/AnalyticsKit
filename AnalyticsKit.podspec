Pod::Spec.new do |s|
  s.name         = "AnalyticsKit"
  s.version      = "2.1.3"

  s.summary      = "Analytics framework for iOS"

  s.description  = <<-DESC
                      The goal of AnalyticsKit is to provide a consistent API for analytics regardless of which analytics provider you're using behind the scenes.

                      The benefit of using AnalyticsKit is that if you decide to start using a new analytics provider, or add an additional one, you need to write/change much less code!

                      AnalyticsKit works both in ARC based projects and non-ARC projects.
                  DESC

  s.homepage     = "https://github.com/twobitlabs/AnalyticsKit"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.authors      = { "Two Bit Labs" => "", "Todd Huss" => "", "Susan Detwiler" => "", "Christopher Pickslay" => "", "Zac Shenker" => "", "Sinnerschrader Mobile" => "" }



  s.platform     = :ios, '11.0'
  s.source       = { :git => "https://github.com/twobitlabs/AnalyticsKit.git", :tag => s.version.to_s }
  s.requires_arc = false
  s.static_framework = true

  s.subspec 'Core' do |core|
    core.source_files  = 'AnalyticsKit.swift', 'AnalyticsKitEvent.swift', 'AnalyticsKitDebugProvider.swift', 'AnalyticsKitUnitTestProvider.swift', 'AnalyticsKit/AnalyticsKit/AnalyticsKitTimedEventHelper.swift'
  end

  s.subspec 'Crashlytics' do |c|
    c.source_files = 'Providers/Crashlytics/AnalyticsKitCrashlyticsProvider.swift'
    c.dependency 'Firebase/Crashlytics'
    c.dependency 'Firebase/Analytics'
    c.dependency 'AnalyticsKit/Core'
  end

  s.subspec 'Firebase' do |f|
    f.source_files = 'Providers/Firebase/AnalyticsKitFirebaseProvider.swift'
    f.dependency 'Firebase/Analytics'
    f.dependency 'AnalyticsKit/Core'
  end

  s.subspec 'Mixpanel' do |m|
    m.source_files = 'Providers/Mixpanel/AnalyticsKitMixpanelProvider.swift'
    m.dependency 'Mixpanel-swift'
    m.dependency 'AnalyticsKit/Core'
  end
end
