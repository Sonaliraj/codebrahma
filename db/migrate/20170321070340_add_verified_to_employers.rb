class AddVerifiedToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :pin, :integer
    add_column :employers, :verified, :boolean, default: false
  end
end
