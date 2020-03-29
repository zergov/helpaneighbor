class RemoveSecurityQuestionFromHelpRequest < ActiveRecord::Migration[6.0]
  def change
    remove_column :help_requests, :security_question
    remove_column :help_requests, :security_question_answer
  end
end
