class CreateDnsHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :dns_hosts do |t|
      t.references :host, foreign_key: true
      t.references :dns, foreign_key: true

      t.timestamps
    end
  end
end
