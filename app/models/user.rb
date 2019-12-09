class User < ApplicationRecord
  has_secure_password
  validates :email, presence:true, uniqueness:true
  validates :phonenumber, presence:true
  validates :fname, presence:true, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}
  validates :lname, presence:true, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}
  validates :emergency_name, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}
  validates :city, presence:true, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}

end
