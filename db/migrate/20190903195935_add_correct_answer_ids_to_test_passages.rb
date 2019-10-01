class AddCorrectAnswerIdsToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :answer_ids, :string
  end
end
