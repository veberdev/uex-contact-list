puts 'Starting seeding, please wait...'

# Limpar dados antigos
Contact.delete_all
User.delete_all

# Função para gerar CPF válido
def generate_valid_cpf
  CPF.generate
end

def create_10_contacts(user)
  10.times do
    user.contacts.create!(
      name: Faker::Name.name,
      cpf: generate_valid_cpf,
      phone: Faker::PhoneNumber.phone_number,
      # address: Faker::Address.street_address,
      address: 'Pasteur',
      # zip_code: Faker::Address.zip_code,
      zip_code: '80250-104',
      complement: Faker::Address.secondary_address
    )
  end
end

# Criar usuário
user1 = User.create!(
  email: 'admin@admin.com',
  password: 'admin'
)

user2 = User.create!(
  email: 'admin2@admin.com',
  password: 'admin2'
)

create_10_contacts(user1)
create_10_contacts(user2)

puts 'Seeding completed successfully! A brand new user has been created with 10 contacts!'
