class UsersController < ApplicationController
	def index
		@user = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new params[user_params]

		if @user.save
			redirect_to @user, notice: 'Cadastro criado com sucesso!'
		else
			#render action: :new
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:full_name, :location, :email, :password, :password_confirmation, :bio)
	end
end