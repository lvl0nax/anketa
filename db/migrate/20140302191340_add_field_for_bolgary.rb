class AddFieldForBolgary < ActiveRecord::Migration
  def change
    add_column :participants, :bolgary, :string
  end
end
