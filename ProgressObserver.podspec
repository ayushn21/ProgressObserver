Pod::Spec.new do |s|
  s.name              = "ProgressObserver"
  s.version           = "1.0.0"
  s.summary           = "ProgressObserver is a subclass on NSProgress that provides an elegant delegate API over KVO"
  s.author            = { "Ayush Newatia" => "ayush.newatia@icloud.com" }
  s.platform          = :ios, '9.0'
  s.homepage          = "https://github.com/ayushn21/ProgressObserver"
  s.source            = { :git => "https://github.com/ayushn21/ProgressObserver.git", :tag => s.version.to_s }
  s.social_media_url  = 'https://twitter.com/ayushn21'
  s.license           = 'MIT'
  s.requires_arc      = true
  s.source_files      = 'ProgressObserver/*.swift'
end
