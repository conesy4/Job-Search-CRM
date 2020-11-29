# == Schema Information
#
# Table name: firms
#
#  id              :integer          not null, primary key
#  bookmarks_count :integer
#  created_by      :string
#  creator         :string
#  employees_count :integer
#  industry        :string
#  jobs_count      :integer
#  location        :string
#  name            :string
#  notes           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Firm < ApplicationRecord

  has_many(:jobs, { :class_name => "Job", :foreign_key => "firm_id" })
  
  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "firm_id" })
  
  has_many(:employees, { :class_name => "Employee", :foreign_key => "firm_id" })
  
  #Add Indirect Associations (Guide)
  
  has_many(:connections, { :through => :employees, :source => :connections })
  
  has_many(:communications, { :through => :connections, :source => :communications })
  
  #Add Validations (Guide)
  
  validates(:name, { :presence => true })
  
  validates(:industry, { :inclusion => { :in => [ "Retail", "Tech", "CPG", "Consulting", "Finance", "Market Research", "Other" ] } })  

end
