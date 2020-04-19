class CreateBadgeCheckersTestPassages < ActiveRecord::Migration[5.2]
  def change
    create_table :badge_checkers_test_passages do |t|
      t.integer :badge_checker_id
      t.integer :test_passage_id
    end
  end
end
