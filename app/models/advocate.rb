# == Schema Information
#
# Table name: advocates
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  contact_id :integer
#  job_id     :integer
#
class Advocate < ApplicationRecord
  
  belongs_to(:job, { :required => false, :class_name => "Job", :foreign_key => "job_id", :counter_cache => true })

  belongs_to(:contact, { :required => false, :class_name => "Contact", :foreign_key => "contact_id", :counter_cache => true })

  #Add Validations (Guide)

  validates(:job_id, { :presence => true })

  validates(:contact_id, { :presence => true })

end
