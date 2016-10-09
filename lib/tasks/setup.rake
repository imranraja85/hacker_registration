desc "Generate an initial admin account"
task generate_admin: :environment do
  Admin.create(email: ENV['ADMIN_EMAIL'] || 'admin@admin.com', password: ENV['ADMIN_PASSWORD'] || 'password')
end
