class Dns < ApplicationRecord

  has_many :dns_hosts
  has_many :hosts, through: :dns_hosts

  validates :ip, presence: true
end
