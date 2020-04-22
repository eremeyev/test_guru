class CreateBadgeCheckersTestPassages < ActiveRecord::Migration[5.2]
  def change
    create_table :badge_checkers_test_passages do |t|
      t.references :badge_checker, foreign_key: true
      t.references :test_passage, foreign_key: true
    end
  end
end
