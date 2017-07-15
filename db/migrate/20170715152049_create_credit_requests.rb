class CreateCreditRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_requests do |t|
      t.string :call_id
      t.json :data

      t.timestamps
    end
  end
end
