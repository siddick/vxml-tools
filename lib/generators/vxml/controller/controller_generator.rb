require 'rails/generators/erb'

module Vxml 
  module Generators
    class ControllerGenerator < Erb::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :actions, :type => :array, :default => [], :banner => "action action"

      def copy_view_files
        base_path = File.join("app/views", class_path, file_name)
        empty_directory base_path

        actions.each do |action|
          @action = action
          @path = File.join(base_path, filename_with_extensions(action))
          template filename_with_extensions(:view), @path
        end
      end

      private 
      def format
        :vxml
      end
    end
  end
end
