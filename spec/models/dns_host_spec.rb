require 'rails_helper'

RSpec.describe DnsHost, type: :model do
  it { should validate_presence_of(:dns_id) }
  it { should validate_presence_of(:host_id) }
end
