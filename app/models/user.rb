class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
		     :omniauthable, :omniauth_providers => [:facebook]


  has_many :posts
  has_many :replies
  has_many :engage_states
  has_many :post_ratings

	mount_uploader :image, S3Uploader

  def get_user_rating
  	rating_count = post_ratings.count

		if rating_count == 0
			return 0
		else
			sum = 0
		  post_ratings.each do |p|
	      sum += p.rating
	    end
	    return sum.to_f / rating_count
	  end
	end

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.name = auth.info.name   # assuming the user model has a name
	    user.image = auth.info.image # assuming the user model has an image
	  end
	end
	def self.new_with_session(params, session)
	    super.tap do |user|
	      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
	        user.email = data["email"] if user.email.blank?
	      end
	    end
  	end

end
