# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class DocumentManagerExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/document_manager"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :document_manager
  #   end
  # end
  
  def activate
     admin.tabs.add "Document Manager", "document_manager", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Document Manager"
  end
  
end
