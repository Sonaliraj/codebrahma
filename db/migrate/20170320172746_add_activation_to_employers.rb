class AddActivationToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :activation_digest, :string
    add_column :employers, :activated, :boolean, default: false
  end
end
