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

require "helper"
require "gcloud/storage"

describe Gcloud::Storage do
  it "has resumable_threshold" do
    Gcloud::Upload.resumable_threshold.must_equal 5_000_000
  end

  it "can update resumable_threshold" do
    old_threshold = Gcloud::Upload.resumable_threshold
    Gcloud::Upload.resumable_threshold = 10_000_000
    Gcloud::Upload.resumable_threshold.must_equal 10_000_000
    Gcloud::Upload.resumable_threshold = old_threshold
  end
end
