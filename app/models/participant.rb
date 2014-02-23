class Participant < ActiveRecord::Base
  attr_accessible :abroad_apartment, :accessories, :attitude, :birthday, :company, :email, :frequency,
                  :hotel, :important_thing, :improvements, :name, :phone, :source_info, :summer_holiday,
                  :surname, :thirdname, :time_using, :trip_time, :drinking_place

  #validates :accessories, :attitude, :birthday, :email,
  #          :important_thing, :improvements, :name, :phone, :source_info,
  #          :surname, :thirdname, :time_using, :drinking_place, :presence => {:message => 'Attribute cannot be blank'}
end
