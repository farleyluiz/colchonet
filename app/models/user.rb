class User < ActiveRecord::Base
	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	validates_presence_of :email, :full_name, :location, :password
	validates_confirmation_of :password
	validates_length_of :bio, minimum: 10, allow_blank: false
	validates_uniqueness_of :email
	validates_length_of :email, in: 8..30

	validate :email_format

	def email_format
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
	end

##################################################################
# Pode ser utilizado um validador de email baseado em bloco como
# o que esta comentado abaixo
##################################################################
=begin
	validete do
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
=end
	private
=begin
	#Essa validação pode ser representada da seguinte dorma:
	validates_format_of :email, with: EMAIL_REGEXP
=end
	validate do
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
	end

end
