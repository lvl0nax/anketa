class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :surname
      t.string :thirdname
      t.date :birthday
      t.string :email
      t.string :phone
      t.string :source_info
      t.string :time_using
      t.string :important_thing
      t.string :accessories
      t.string :improvements
      t.string :hotel
      t.string :company
      t.string :trip_time
      t.string :frequency
      t.string :summer_holiday
      t.string :attitude
      t.string :abroad_apartment

      t.timestamps
    end
  end
end
