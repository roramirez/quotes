class CreateSuscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :suscribers do |t|
      t.string :username
      t.string :domain
      t.string :password
      t.string :email_address
      t.string :ha1
      t.string :ha1b
      t.string :rpid

      t.timestamps
    end
  end
end
