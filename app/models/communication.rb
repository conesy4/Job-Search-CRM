# == Schema Information
#
# Table name: communications
#
#  id            :integer          not null, primary key
#  comm_type     :string
#  date          :date
#  followup_date :date
#  incoming      :boolean
#  notes         :string
#  outgoing      :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  contact_id    :integer
#  job_id        :integer
#  user_id       :integer
#
class Communication < ApplicationRecord

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })

  belongs_to(:job, { :required => false, :class_name => "Job", :foreign_key => "job_id", :counter_cache => true })

  belongs_to(:contact, { :required => false, :class_name => "Contact", :foreign_key => "contact_id", :counter_cache => true })

  #Add Indirect Associations (Guide)

  has_one(:firm, { :through => :contact, :source => :firm })

  #Add Validations (Guide)

  validates(:user_id, { :presence => true })

  validates(:job_id, { :presence => true })

  validates(:date, { :presence => true })

  validates(:contact_id, { :presence => true })

end
