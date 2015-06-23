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
    question = Question.create(title: 'How do I make a repository and push to github from the command line', body: "Lalalala. Create a new repository on GitHub. Open Terminal (for Mac users) or the command prompt (for Windows and Linux users). Change the current working directory to your local project. Initialize the local directory as a Git repository. Add the files in your new local repository")

    visit '/questions'
    click_link("How do I make a repository and push to github from the command line")

    expect(page).to have_content(question.title)    
    expect(page).to have_content(question.body)
  end
end
