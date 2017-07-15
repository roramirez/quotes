class AddSimulationResponseToCreditRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :credit_requests, :simulation_response, :json
  end
end
