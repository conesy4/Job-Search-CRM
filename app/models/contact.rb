# == Schema Information
#
# Table name: contacts
#
#  id                   :integer          not null, primary key
#  advocates_count      :integer
#  communications_count :integer
#  followup_date        :date
#  incoming_comms       :string
#  last_incoming_comm   :date
#  last_outgoing_comm   :date
#  notes                :string
#  outgoing_comms       :string
#  relationship         :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  employee_id          :integer
#  user_id              :integer
#
class Contact < ApplicationRecord

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  
  has_many(:communications, { :class_name => "Communication", :foreign_key => "contact_id" })
  
  has_many(:advocates, { :class_name => "Advocate", :foreign_key => "contact_id" })
  
  belongs_to(:employee, { :required => false, :class_name => "Employee", :foreign_key => "employee_id", :counter_cache => :connections_count })
  
  #Add Indirect Associations (Guide)
  
  has_many(:jobs, { :through => :advocates, :source => :job })
  
  has_one(:firm, { :through => :employee, :source => :firm })
  
  #Add Validations (Guide)
  
  validates(:user_id, { :presence => true })
  
  validates(:employee_id, { :presence => true })

end
