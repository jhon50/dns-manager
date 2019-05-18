class DnsHost < ApplicationRecord
  belongs_to :host
  belongs_to :dns

  validates :dns_id, presence: true
  validates :host_id, presence: true
end
