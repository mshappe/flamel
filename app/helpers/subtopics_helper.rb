# Copyright 2013 Michael Scott Shappe
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module SubtopicsHelper
  def available_people(subtopic)
    Person.where.not(id: subtopic.people.collect(&:id)).map do |p|
      [p.sca_name, p.id]
    end
  end
  def assigned_people(subtopic)
    subtopic.people.map do |p|
      [p.sca_name, p.id]
    end
  end
end
