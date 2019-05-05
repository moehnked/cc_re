class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def index
		@users = User.all
	end

	def create
		user = User.create(
			username: params[:user][:username], 
			password: params[:user][:password], 
			email: params[:user][:email])
		user.garage = Garage.create(user: user) 
		if user.save
			redirect_to users_path
		else
			render :new
		end
	end

	#########

	# def create(params)

	# 	user = User.create(
	# 		username: params.fetch(:username, "default_username"),
	# 		password: params.fetch(:password, "default_password"),
	# 		email: params.fetch(:email, "default@email.com"),
	# 		garage: params.fetch(:garage, Garage.new))
	# 	user.garage.setup(user: self)
	# 	@result = user.save
	# 	if result? 
	# 		redirect_to users_path
	# 	else 
	# 		render :new
	# 	end
	# end
end
