# Copyright 2017 OpenCensus Authors
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


module OpenCensus
  module Trace
    module Formatters
      class B3

        HEADER_NAME = "x-b3-traceid".freeze

        RACK_HEADER_NAME = "HTTP_X_B3_TRACEID".freeze

        ##
        # Returns the name of the header used for context propagation.
        #
        # @return [String]
        #
        def header_name
          HEADER_NAME
        end

        ##
        # Returns the name of the rack_environment header to use when parsing
        # context from an incoming request.
        #
        # @return [String]
        #
        def rack_header_name
          RACK_HEADER_NAME
        end

        ##
        # Deserialize a trace context header into a TraceContext object.
        #
        # @param [String] header
        # @return [TraceContextData, nil]
        #
        def deserialize header
          if header
            TraceContextData.new header,
                                 nil,
                                 nil
          else
            nil
          end
        end

        ##
        # Serialize a TraceContextData object.
        #
        # @param [TraceContextData] trace_context
        # @return [String]
        #
        def serialize trace_context
          trace_context.trace_id
        end
      end
    end
  end
end
