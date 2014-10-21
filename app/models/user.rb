class User < ActiveRecord::Base
	#EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	validates_presence_of :email, :full_name, :location, :password
	validates_confirmation_of :password
	validates_length_of :bio, minimum: 10, allow_blank: false
	validates_uniqueness_of :email

	private

	#Essa validação pode ser representada da seguinte dorma:
	#validates_format_of :email, with: EMAIL_REGEXP
=begin
	validate do
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
	end
=end	
end
