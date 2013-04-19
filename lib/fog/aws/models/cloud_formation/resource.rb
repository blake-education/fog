require 'fog/core/model'

module Fog
  module AWS
    class CloudFormation
      class Resource < Fog::Model
        identity :id,                 :aliases => 'PhysicalResourceId'

				attribute :description            , :aliases => "Description"
				attribute :logical_resource_id    , :aliases => "LogicalResourceId"
				attribute :resource_status        , :aliases => "ResourceStatus"
				attribute :resource_status_reason , :aliases => "ResourceStatusReason"
				attribute :resource_type          , :aliases => "ResourceType"
				attribute :stack_id               , :aliases => "StackId"
				attribute :stack_name             , :aliases => "StackName"
				attribute :timestamp              , :aliases => "Timestamp"            , :type => :date_time
      end
    end
  end
end
