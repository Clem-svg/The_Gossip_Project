module SessionsHelper

  def current_user
    if session[:user_id]
      current_user = User.find_by(id: session[:user_id])
    elsif cookies[:user_id]
      user = User.find_by(id: cookies[:user_id])
      if current_user && BCrypt::Password.new(user.remember_digest).is_password?(cookies[:remember_token])
        log_in user
        current_user = user
      end
    end
  end

   def log_in(user)
    session[:user_id] = user.id
  end

  def is_author(user)
    if current_user == user
      return true
    else
      return false
    end
  end

  def remember(user)
    # ici je vais créer un remember_token qui est une suite aléatoire de caractères
    remember_token = SecureRandom.urlsafe_base64
    # j'ai mon token, je vais stocker son digest en base de données :    
    user.remember(remember_token)
    #  maintenant, je vais créer les cookies : un cookie qui va conserver l'user_id, et un autre qui va enregistrer le remember_token
    cookies.permanent[:user_id] = user.id
    cookies.permanent[:remember_token] = remember_token
  end

  def forget(user)
  # on remet le remember_digest à nil puisqu'il ne nous servira plus :
  user.update(remember_digest: nil)
  # on efface les cookies dans le navigateur de l'utilisateur
  cookies.delete(:user_id)
  cookies.delete(:remember_token)
  end

  def log_out(user)
    session.delete(:user_id)
    forget(user)
  end
end