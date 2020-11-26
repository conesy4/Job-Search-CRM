# == Schema Information
#
# Table name: employees
#
#  id                :integer          not null, primary key
#  alumni            :boolean
#  connections_count :integer
#  email             :string
#  first_name        :string
#  last_name         :string
#  linkedin          :string
#  notes             :string
#  role              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  firm_id           :integer
#
class Employee < ApplicationRecord

  belongs_to(:firm, { :required => false, :class_name => "Firm", :foreign_key => "firm_id", :counter_cache => true })

  has_many(:connections, { :class_name => "Contact", :foreign_key => "employee_id" })

  #Add Validations (Guide)

  validates(:last_name, { :presence => true })

  validates(:first_name, { :presence => true })

  validates(:firm_id, { :presence => true })

end
