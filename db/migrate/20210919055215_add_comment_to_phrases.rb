class AddCommentToPhrases < ActiveRecord::Migration[5.2]
  def change
    add_column :phrases, :comment, :string
  end
end
