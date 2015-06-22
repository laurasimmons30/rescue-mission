require 'rails_helper'

feature 'visitor visits details page and sees question description', %(
  As a user
  I want to view a question's details
  So that I can effectively understand the question
  ) do 

  #Acceptance Criteria
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  scenario 'user visits details page and sees body of the question' do
    question = Question.create(title: 'How to push to github', body: "Can anyone give me the command line prompts?")

    visit '/questions'
    click_on('questions/1')

    expect(page).to have_content(question.title)    
    expect(page).to have_content(question.body)
  end
end
