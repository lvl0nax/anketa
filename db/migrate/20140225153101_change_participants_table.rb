class ChangeParticipantsTable < ActiveRecord::Migration
  def change
    add_column :participants, :wish, :text
    add_column :participants, :reason, :text
  end
end
