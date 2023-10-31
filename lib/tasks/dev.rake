# frozen_string_literal: true

DEFAULT_PASSWORD = '123456'

namespace :dev do
  desc 'Configures the development environment'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Dropping BD...') { `rails db:drop` }
      show_spinner('Creating BD...') { `rails db:create` }
      show_spinner('Migrating BD...') { `rails db:migrate` }
      show_spinner('Generating default admin...') { `rails dev:add_default_admin` }
      show_spinner('Generating extra admins...') { `rails dev:add_extra_admins` }
      show_spinner('Generating default user...') { `rails dev:add_default_user` }
    else
      puts 'Cannot run this rake in environment other than development!'
    end
  end

  desc 'Addds default admin'
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc 'Adds extra admins'
  task add_extra_admins: :environment do
    10.times do |_i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc 'Adds default user'
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  private

  def show_spinner(msg_start, msg_end = 'Finished!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
