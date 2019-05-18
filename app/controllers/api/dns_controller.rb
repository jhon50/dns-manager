module Api
  class DnsController < ApplicationController

    around_action :handle_exceptions, only: [:index, :create]

    def index
      @dns_query = DnsQuery.new(dns_search_params)
    end

    def create
      DnsCreatorService.new(dns_params).call
    end

    private

    def dns_params
      params.permit(:ip, host_names: [])
    end

    def dns_search_params
      params.permit(:page, host_names_in: [], host_names_out: [])
    end

    def handle_exceptions
      yield
    rescue StandardError => e
      redirect_to api_dns_path
    end
  end
end
