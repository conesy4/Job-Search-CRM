# == Schema Information
#
# Table name: jobs
#
#  id                     :integer          not null, primary key
#  advocates_count        :integer
#  application_date       :date
#  application_deadline   :date
#  application_mode       :string
#  application_next_steps :string
#  application_outcome    :string
#  application_status     :string
#  applied                :boolean
#  communications_count   :integer
#  location               :string
#  notes                  :string
#  role                   :string
#  website                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  bookmark_id            :integer
#  firm_id                :integer
#  user_id                :integer
#
class Job < ApplicationRecord

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  
  belongs_to(:firm, { :required => false, :class_name => "Firm", :foreign_key => "firm_id", :counter_cache => true })
  
  has_many(:communications, { :class_name => "Communication", :foreign_key => "job_id" })
  
  has_many(:advocates, { :class_name => "Advocate", :foreign_key => "job_id", :dependent => :destroy })

  belongs_to(:bookmark, { :required => false, :class_name => "Bookmark", :foreign_key => "bookmark_id", :counter_cache => true })
  
  #Add Indirect Associations (Guide)
  
  has_many(:contacts, { :through => :advocates, :source => :contact })
  
  #Add Validations (Guide)
  
  validates(:user_id, { :presence => true })
  
  validates(:role, { :presence => true })

  validates(:application_deadline, { :presence => true })  

  validates(:firm_id, { :presence => true })

  validates(:bookmark_id, { :presence => true })

end
