class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :role
    end

    create_table :employers do |t|
      t.belongs_to :user, index: true
      t.text :description
      t.string :icon_url
    end

    create_table :applicants do |t|
      t.belongs_to :user, index: true
      t.integer :phone_number
      t.text :description
      t.string :resume_link
      t.text :fields, array: true, default: []
      t.boolean :paired
    end

    create_table :jobs do |t|
      t.belongs_to :employer, index: true
      t.string :position
      t.text :description
      t.text :requirements
      t.string :job_type
      t.text :apply_info
      t.text :tags, array: true, default: []
    end

    create_table :students do |t|
      t.string :name
      t.string :concentration
      t.string :industry
      t.string :resume_link
    end

    create_table :students_applicants do |t|
      t.belongs_to :applicants, index: true
      t.belongs_to :students, index: true
    end
  end

  def down
    drop_table :users
    drop_table :employers
    drop_table :applicants
    drop_table :jobs
    drop_table :students
    drop_table :students_applicants
  end
end
