class Users_Validator < ActiveModel::Validator
  def validate(user)
    if !(user.password_unhashed.blank?) && user.username.blank?
      user.errors[:base] << "If password is inserted you have to insert a username"
    elsif !(user.username.blank?) && user.password_unhashed.blank?
      user.errors[:base] << "If username is inserted you have to insert a password"
    end

    if !(user.mobile_number.blank?)
      numberAfterRegex = user.mobile_number.match(/(^(\+?\-?[0-9\(]+)([,0-9]*)([0-9\.\(\)\/-])*$)/)
      if numberAfterRegex.blank?
        user.errors[:base] << "Please enter a valid mobil number"
      end
    end
  end
end