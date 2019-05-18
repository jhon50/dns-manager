class DnsQuery

  def initialize(params = {}, relation = Dns.joins(dns_hosts: :host))
    @params = params
    @relation = relation
  end

  def count_by_hosts
    @params[:host_names_in].map do |host_name|
      dns = @relation.where(hosts: {name: host_name})

      [host_name, dns.count]
    end.to_h
  end

  def dns_in
    @relation.where(hosts: {name: @params[:host_names_in]}).select(:id, :ip).uniq
  end
end