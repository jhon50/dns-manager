class DnsCreatorService

  def initialize(dns_params)
    @dns_params = dns_params
  end

  def call
    ActiveRecord::Base.transaction do
      host_names = @dns_params.fetch(:host_names, [])
      dns = create_dns
      host_names.map do |host_name|
        DnsHost.create!(dns: dns, host: create_host(host_name))
      end
    end
  end

  private

  def create_dns
    Dns.create!(ip: @dns_params.fetch(:ip, nil))
  end

  def create_host(host_name)
    Host.create!(name: host_name)
  end
end