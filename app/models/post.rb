class Post < ActiveRecord::Base
default_scope order: 'posts.created_at DESC'
has_many :comments	
end
