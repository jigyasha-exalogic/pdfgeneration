class Account < ApplicationRecord
	validates :acname, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}
end
