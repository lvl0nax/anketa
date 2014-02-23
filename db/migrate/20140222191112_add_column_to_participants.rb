class AddColumnToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :drinking_place, :string
  end
end
