# Copyright 2014 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


require "gcloud/errors"

module Gcloud
  module Datastore
    ##
    # # Datastore Error
    #
    # Base Datastore exception class.
    class Error < Gcloud::Error
    end

    ##
    # # KeyfileError
    #
    # Raised when a keyfile is not correct.
    class KeyfileError < Gcloud::Datastore::Error
    end

    ##
    # # PropertyError
    #
    # Raised when a property is not correct.
    class PropertyError < Gcloud::Datastore::Error
    end

    ##
    # # TransactionError
    #
    # General error for Transaction problems.
    class TransactionError < Gcloud::Datastore::Error
      ##
      # An error that occurred within the transaction. (optional)
      attr_reader :commit_error
      alias_method :inner, :commit_error # backwards compatibility

      ##
      # An error that occurred within the transaction. (optional)
      attr_reader :rollback_error

      # @private
      def initialize message, commit_error: nil, rollback_error: nil
        super(message)
        @commit_error   = commit_error
        @rollback_error = rollback_error
      end
    end
  end
end
