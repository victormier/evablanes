class AddSomeKeyValues < ActiveRecord::Migration
  def up
    KeyValue.create([
      { key: 'about_me', value: 'Lorem ipsum' },
      { key: 'about_awards', value: 'Lorem ipsum' },
      { key: 'home_about_me', value: 'Lorem ipsum' },
      { key: 'home_publications', value: 'Lorem ipsum' }
    ])
  end

  def down
  end
end