require 'fog/core/collection'
require 'fog/aws/models/cloud_formation/stack'

module Fog
  module AWS
    class CloudFormation
      class Stacks < Fog::Collection

        model Fog::AWS::CloudFormation::Stack

        def all(options = {})
          data = []
          next_token = nil
          loop do
            result = service.describe_stacks('NextToken' => next_token).body
            data += result['Stacks']
            next_token = result['NextToken']
            break if next_token.nil?
          end
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

