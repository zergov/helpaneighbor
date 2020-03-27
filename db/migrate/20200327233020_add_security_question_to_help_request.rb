class AddSecurityQuestionToHelpRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :help_requests, :security_question, :string
    add_column :help_requests, :security_question_answer, :string
  end
end
