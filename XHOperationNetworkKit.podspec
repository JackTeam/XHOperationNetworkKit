Pod::Spec.new do |s|
  s.name         = "XHOperationNetworkKit"
  s.version      = "0.1"
  s.summary      = "XHOperationNetworkKit 是一款轻量级的网络访问库。"
  s.homepage     = "https://github.com/xhzengAIB/XHOperationNetworkKit"
  s.license      = "MIT"
  s.authors      = { "xhzengAIB" => "xhzengAIB@gmail.com" }
  s.source       = { :git => "https://github.com/xhzengAIB/XHOperationNetworkKit.git", :tag => "v0.1" }
  s.frameworks   = 'Foundation'
  s.platform     = :ios, '5.0'
  s.source_files = 'Source/*.{h,m}'
  s.requires_arc = true
end
