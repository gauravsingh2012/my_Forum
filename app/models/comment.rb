class Comment < ActiveRecord::Base
default_scope order: 'comments.score DESC'
belongs_to :post
belongs_to :user
end
