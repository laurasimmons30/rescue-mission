require 'rails_helper'

feature 'visitor views full list of question', %( 
  As a user
  I want to view recently posted questions
  So that I can help others
) do 
  #Acceptance Criteria
# - I must see the title of each question
# - I must see questions listed in order, most recently posted first

  scenario 'question has a title' do
    question = Question.create(title: 'How to push to github', description: "Can anyone give me the command line prompts?")
    
    visit '/questions'
    expect(page).to have_content(question.title)
  end
end
