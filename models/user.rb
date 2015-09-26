class User < ActiveRecord::Base

    has_many :list_entries
    # allows you to modify and get the 'is_admin' attribute
    attr_accessor :is_admin

    include BCrypt
    before_create :generate_token

    def password
        Password.new( self.password_hash )
    end

    def password=( new_password )
        self.password_hash = Password.create( new_password )
    end

    def generate_token
        self.token = SecureRandom.urlsafe_base64(nil, false)
    end

    # def sign_in_as_admin(params)
    #
    #     if params[:admin]=="on"
    #         self.is_admin = true
    #     else
    #         self.is_admin = false
    #     end
    # end

    def is_admin?
        self.is_admin ==true

    end





end
