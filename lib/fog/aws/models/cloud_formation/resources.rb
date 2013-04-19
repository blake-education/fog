require 'fog/core/collection'
require 'fog/aws/models/cloud_formation/resource'

module Fog
  module AWS
    class CloudFormation
      class Resources < Fog::Collection

        model Fog::AWS::CloudFormation::Resource

        def all(options = {})
					data = service.describe_stack_resources(options.tapp("desc_stack_res")).body["StackResources"]
          load(data)
        end

        def get(stack_name)
          data = service.describe_stacks("StackName" => stack_name).body["Stacks"].first
          new(data) unless data.nil?
        rescue Excon::Errors::NotFound
          nil
        end
      end
    end
  end
end


