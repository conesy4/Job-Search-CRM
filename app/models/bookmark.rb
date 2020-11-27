# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  notes      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  firm_id    :integer
#  user_id    :integer
#
class Bookmark < ApplicationRecord

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  
  belongs_to(:firm, { :required => false, :class_name => "Firm", :foreign_key => "firm_id", :counter_cache => true })
  
#  has_many(:contacts, { :through => :firms, :source => :contact })

  #has_many(:contacts, {
  #  :through => "Firm",
  #  :through => "Employee"
  #  :source => "Contact"
  #})

  #Add Validations (Guide)
  
  validates(:user_id, { :presence => true })
  
  validates(:firm_id, { :presence => true })  

  validates(:user_id, { :uniqueness => { :scope => ["firm_id"], :message => "Already Bookmarked" } })

  validates(:firm_id, { :uniqueness => { :scope => ["user_id"], :message => "Already Bookmarked" } })

end
