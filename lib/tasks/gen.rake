require 'csv'

namespace :gen do

		desc "genera una lista de usuarios"
		task users: :environment do
			CSV.open('/Users/Paula/Desktop/rails_projects/store_mrcoffey/users.csv', 'w') do |csv|#lo guardo con /users.csv al final
			#con 'w' le digo que voy a sobrescribir sobre ese archivo
			#primer parámetro es la ruta donde se va guardar
			#el segundo parámetro es para abrirlo en modo de escritura(el formato en que quiero abrir el archivo)
			User.all.each do |user|
				#itero sobre todos los usuarios
				csv << [user.email, user.name]
			end
		end
	end


end
