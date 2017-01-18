Pod::Spec.new do |s|
 
  s.name         = "YJProgressHUD"
  s.version      = "1.0.1"
  s.summary      = "easy use YJProgressHUD on iOS"
  s.description  = "easy use YJProgressHUD on iOS，use by readme"
 
  s.homepage     = "https://github.com/TangledHusky/YJProgressHUD"
 
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "TangledHusky" => "994825763@qq.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/TangledHusky/YJProgressHUD.git", :tag => "v#{s.version}" }
  s.source_files  = "YJProgressHUDK/*.{h,m}"
  s.dependency "MBProgressHUD"  #依赖关系，该项目所依赖的其他库，如果有多个需要填写多个s.dependency
  s.resources = [YJProgressHUD/*.xcassets']
end