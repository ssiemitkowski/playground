class User < ActiveRecord::Base
  
          attr_accessible :email, 
                          :password, 
                          :password_confirmation,
                          :role,
                          :status,
                          :benutzername,
                          :benutzerkennung,
                          :firma,
                          :anrede,
                          :vorname,
                          :nachname,
                          :strasse,
                          :hausnummer,
                          :postleitzahl,
                          :ort,
                          :land,
                          :zeitzone,
                          :telefon,
                          :mobile,
                          :steuernummer,
                          :geburtsdatum

            attr_accessor :password
              before_save :encrypt_password
  
validates_confirmation_of :password , :message => " Wiederholung fehlgeschlagen"
    validates_presence_of :password, :on => :create, :message => " ist Pflichtangabe"
    validates_presence_of :email , :message => " ist Pflichtangabe"
  validates_uniqueness_of :email
  
    validates_presence_of :strasse, :on => :update, :message => " ist Pflichtangabe"
    validates_presence_of :hausnummer, :on => :update, :message => " ist Pflichtangabe"
    validates_presence_of :postleitzahl, :on => :update, :message => " ist Pflichtangabe"
    validates_presence_of :ort, :on => :update, :message => " ist Pflichtangabe"
    validates_presence_of :land, :on => :update, :message => " ist Pflichtangabe"
    validates_presence_of :zeitzone, :on => :update, :message => " ist Pflichtangabe"
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end

