namespace :badges do
  desc "create badges"
  task create: :environment do
    # update property on RM
    puts "Create badges for categories"
    Category.all.each_with_index do |category, category_index|
      b = Badge.find_or_create_by(name: "All tests for Category '#{category.title}' are successfull")
      b.update(
        name: "All tests for Category '#{category.title}' are successfull",
        image: 'star',
        color: Badge::COLORS[category_index],
        method: :all_for,
        args: "{category: Category.#{category.title.parameterize(separator: "_", preserve_case: false)}}"
      )   
    end
   
    puts "Create badges for test levels"
    Test::LEVELS.each_with_index do |level, level_index|
      b = Badge.find_or_create_by(name: "All tests for Level '#{level}' are successfull")
      b.update(
        image: 'flame',
        color: Badge::COLORS[level_index],
        method: :all_for,
        args: "{level: '#{level}'}"
      )
    end
    
    b = Badge.find_or_create_by(name: "Test passed in the First attempt")
    b.update(
      image: 'rocket',
      color: 'red',
      method: "count_eq",
      args: 1
    )
  end
end