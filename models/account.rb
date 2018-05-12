require 'sequel'
require 'json'

module Credence
  # Models a registered account
  class Account < Sequel::Model
    one_to_many :owned_projects, class: :'Credence::Project', key: :owner_id
    plugin :association_dependencies, owned_projects: :destroy

    many_to_many :collaborations,
                 class: :'Credence::Project',
                 join_table: :accounts_projects,
                 left_key: :collaborator_id, right_key: :project_id

    plugin :whitelist_security
    set_allowed_columns :username, :email, :password

    plugin :timestamps, update_on_create: true

    def projects
      owned_projects + collaborations
    end

    def password=(new_password)
      self.salt = SecureDB.new_salt
      self.password_hash = SecureDB.hash_password(salt, new_password)
    end

    def password?(try_password)
      try_hashed = SecureDB.hash_password(salt, try_password)
      try_hashed == password_hash
    end

    def to_json(options = {})
      JSON(
        {
          type: 'account',
          username: username,
          email: email
        }, options
      )
    end
  end
end
