# == VXML 
# === Example
#   vxml =
#     VXML.new do |v|
#       v.prompt "Welcome to All"
#       v.if_cond "1==1" do |v|
#         v.prompt "Both are equal"
#       end
#     end
#   vxml.to_s  
#
#   ( or )  
#
#   vxml = VXML.new
#   vxml.prompt "Welcome to All"
#   ifbk = vxml.if_cond "1=="
#     ifbk.prompt "Both are equal"
#   vxml.to_s
#   
class VXML
  def initialize( tag = 'vxml', options = { :version => "2.0", :xmlns =>"http://www.w3.org/2001/vxml" }, &block )
    @tag = tag
    @options = options
    @contents = []
    if( block )
      block.call(self)
    end
  end

  def options
    @options
  end

  def to_s
    "<#{@tag}#{process_options}>#{process_content}</#{@tag}>"
  end

  def process_options
    if( @options.size > 0 )
      " " + @options.collect{|key,val|
        "#{key}=\"#{val}\""
      }.join(" ") 
    else
      ""
    end
  end

  def process_content
    @contents.collect{|cont|
      cont.to_s 
    }.join("")
  end

  def string( str )
    push( str )
  end

  def push( obj )
    @contents.push( obj )
    obj
  end

  def method_missing( key, *values, &block )
    keys = key.to_s.split(/_/)
    tag = keys.shift
    options = {}

    keys.each{|key|
      options[key] = values.shift
    }

    v = VXML.new( tag, options )
    values.each{|val|
      if( val.is_a? Hash )
        v.options.merge! val 
      else
        v.string val
      end
    }

    if( block )
      block.call( v )
    end

    push( v )
  end
  
end
