class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
   has_many :exercises
   has_many :friendships
   #We don't have a friends table or model. In reality a friend is just "another user"
   #But to make code clearer and logic easier to understand, we can refer to them as
   #friends but we have to tell rails what the underlying table/class it is
   has_many :friends, through: :friendships, class_name: "User"
   validates_presence_of :first_name
   validates_presence_of :last_name
   
   
   def full_name
     "#{first_name} #{last_name}"
   end
   
   
   def self.search_by_name(name)
       names_array = name.split(' ')
       if names_array.size == 1
           where('first_name LIKE ? or last_name LIKE ?', "%#{names_array[0]}%","%#{names_array[0]}%").order(:first_name)
       else
           where('first_name LIKE ? or first_name LIKE ? or last_name LIKE ? or last_name LIKE ?', "%#{names_array[0]}%","%#{names_array[1]}%","%#{names_array[0]}%","%#{names_array[1]}%").order(:first_name)
       end
   end
   
   
   def follows_or_same?(new_friend)
     friendships.map(&:friend).include?(new_friend) || self == new_friend   
   end
end
