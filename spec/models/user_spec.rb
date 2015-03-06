require "rails_helper"
#se hacen los tests

RSpec.describe User, :type => :model do

	before do
		stub_user
	end
	#defino la prueba a hacer
	it 'save an user with a name and password' do
		user = User.create(name: 'prim', password: '875470' )
		expect(user.persisted?).to be true

	it 'user can not be saved, email error' do
		user = User.create(name: 'Jaime', email: 'jaimito')
		expect(user.persisted?).to be false
		expect(user).to have (1).error_on(:email)
	end

	it 'user can not be saved, password error' do
		user = User.create(name: 'Karly')
		expect(user.persisted?).to be false
		expect(user).to have(1).error_on(:password)

	end

	context 'when user saved' do
		before do
      @user = User.create(name: 'prim', password: '875470')
    end

	it 'change email to user' do
		bool = @user.update_attribute(:email, "prim@prim.com")
		expect(bool).to be true
		expect(@user.errors.size).to eq 0
		expect(@user.email).to eq "prim@prim.com"
	end

	it 'change user name' do
		old_name = @user.name
		@user.update_attribute(:name, "prim875470")
		expect(@user.name).not_to eq old_name

	end

	it 'delete the user' do
		@user.destroy
		expect(User.count).to eq 0
	end

	it 'find by name' do
		@user = @user.where(name: 'prim').first
		#where me devuelve un array, first es el primer 
		expect(@user).not_to be nil
	end
	


end
