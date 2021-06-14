class User < ApplicationRecord
    has_many :companies, dependent: :destroy
    has_many :user_roles, dependent: :destroy
    has_many :roles, through: :user_roles

    # Return the full name of the user, to make the code drier
    def full_name
        return "#{first_name} #{last_name}"
    end
end
