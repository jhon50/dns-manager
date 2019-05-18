require 'rails_helper'

RSpec.describe Dns, type: :model do
  it { should validate_presence_of(:ip) }
end
