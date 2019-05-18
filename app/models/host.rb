class Host < ApplicationRecord

  has_many :dns_hosts
  has_many :dns, through: :dns_hosts

  validates :name, presence: true
end
