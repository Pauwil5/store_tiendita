module GeneralHelpers

	def stub_user
		allow_any_instance_of(User).to receive(:send_email).and_return(nil)
	end

	def create_user
		User.create(name: 'prim', password: '875470)
	end

end
