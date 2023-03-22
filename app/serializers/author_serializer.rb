class AuthorSerializer < ActiveModel::Serializer
  attributes :name, :profile, :posts

  def profile
    ProfileSerializer.new(object.profile).as_json
  end

  def posts
    object.posts.map do |post|
      {
        title: post.title,
        short_content: "#{post.content[0..39]}...",
        tags: post.tags.map(&:name),
      }
    end
  end
end
