require 'rails_helper'
RSpec.describe Api::DnsController, type: :controller do
  render_views

  let!(:valid_params) {
    {
        ip: '123.123.321.321',
        host_names: [
            'lorem.com',
            'sit.net',
            'amet.br'
        ]
    }
  }

  let!(:invalid_params) {
    {
        ip: ''
    }
  }

  describe 'POST create' do
    describe 'with valid_params' do
      it 'creates a new dns entry' do
        expect {
          post :create, params: valid_params
        }.to change { Dns.count }.by(1)
         .and change { Host.count }.by(3)
         .and change { DnsHost.count }.by(3)
      end
    end

    describe 'with invalid_params' do
      it 'does not create a new dns entry' do
        expect {
          post :create, params: invalid_params
        }.to change { Dns.count }.by(0)
      end
    end
  end

  describe 'GET index' do
    before do
      dns = Dns.create!(ip: '123.123.321.321')
      host = Host.create!(name: 'lorem.com')
      DnsHost.create!(dns: dns, host: host)
    end

    it 'renders the template' do
      get :index, params: {
          host_names_in: ['lorem.com'],
          host_names_out: ['ipsum.net', 'dolor.com'],
          page: 1,
          format: :json
      }
      expect(response.status).to eq 200
      expect(response_body["host_with_dns_count"]).to eq({"lorem.com"=>1})

      matching_dns = response_body["matching_dns"].first
      expect(matching_dns["ip"]).to eq '123.123.321.321'
    end
  end

  private

  def response_body
    JSON.parse(response.body)
  end
end