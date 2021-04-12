class CreatPosts < ActiveRecord::Migration[5.2]
  def change :Posts do |p|
    p.text :content
  end
end
