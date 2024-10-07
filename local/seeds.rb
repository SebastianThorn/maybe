# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts 'Run the following command to create demo data: `rake demo_data:reset`' if Rails.env.development?


puts
puts "From seeds.rb"
puts "============="


puts
puts "* Seeding users"
users_yaml_path = "/rails/seed_data/users.yaml"
if File.file?(users_yaml_path)
  puts "  Found #{users_yaml_path}"
  users_yaml = YAML.load_file(users_yaml_path)

  family = Family.new

  users_yaml["users"].each do |yaml_user|
    @user = User.new
    @user.family = family
    @user.email = yaml_user["email"]
    @user.password = yaml_user["password"]
    @user.role = yaml_user["role"]
    @user.save!
  end
end


puts
puts "* Seeding accounts"
accounts_yaml_path = "/rails/seed_data/accounts.yaml"
if File.file?(accounts_yaml_path)
  puts "  Found #{accounts_yaml_path}"
  accounts_yaml = YAML.load_file(accounts_yaml_path)

  family = Family.new

  accounts_yaml["accounts"].each do |yaml_account|
    @account = Account.new
    @account.family = family
    @account.name = yaml_account["name"]
    @account.balance = yaml_account["balance"]
    @account.currency = yaml_account["currency"]
    @account.subtype = yaml_account["subtype"]
    @account.accountable_type = yaml_account["accountable_type"]

    @account.save!
  end
end


puts
puts "Seeding done!"
puts "============="
