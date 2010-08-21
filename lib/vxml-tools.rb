require 'vxml-tools/vxml'

module VXMLTools

  Version = '1.0.0'

  if(  defined? Rails::Engine )
    class Engine < Rails::Engine
    end
  end
end
