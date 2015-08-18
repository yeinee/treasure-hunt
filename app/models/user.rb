class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :replies
  has_many :engage_states
  has_many :post_ratings

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

end
