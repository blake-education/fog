require 'fog/core/model'

module Fog
  module AWS
    class CloudFormation
      class Stack < Fog::Model

        identity :id,                 :aliases => 'StackName'

        attribute :capabilities        , :aliases => 'Capabilities'
        attribute :creation_time       , :aliases => 'CreationTime'      , :type => :time
        attribute :description         , :aliases => 'Description'
        attribute :diable_rollback     , :aliases => 'DisableRollback'
        attribute :last_updated_time   , :aliases => 'LastUpdatedTime'   , :type => :time
        attribute :notification_arns   , :aliases => 'NotificationARNs'  , :type => :array
        attribute :outputs             , :aliases => 'Outputs'
        attribute :parameters          , :aliases => 'Parameters'
        attribute :stack_id            , :aliases => 'StackId'
        attribute :stack_status        , :aliases => 'StackStatus'
        attribute :stack_status_reason , :aliases => 'StackStatusReason'
        attribute :tags                , :aliases => 'Tags'
        attribute :timeout_in_minutes  , :aliases => 'TimeoutInMinutes'  , :type => :integer


        def resources
          requires :id
          service.resources.all("StackName" => id)
        end
      end
    end
  end
end

