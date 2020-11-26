# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  bookmarks_count      :integer
#  communications_count :integer
#  contacts_count       :integer
#  email                :string
#  first_name           :string
#  jobs_count           :integer
#  last_name            :string
#  password_digest      :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  #Direct Associations

  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:contacts, { :class_name => "Contact", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:communications, { :class_name => "Communication", :foreign_key => "user_id", :dependent => :destroy })
  
  has_many(:jobs, { :class_name => "Job", :foreign_key => "user_id", :dependent => :destroy })

  #Validations

  validates(:last_name, { :presence => true })
  
  validates(:first_name, { :presence => true })

end
