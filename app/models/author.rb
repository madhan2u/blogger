class Author < ActiveRecord::Base
  authenticates_with_sorcery!
  
  validates_confirmation_of :password, message: "Confirmation password should match with password", if: :password
end
