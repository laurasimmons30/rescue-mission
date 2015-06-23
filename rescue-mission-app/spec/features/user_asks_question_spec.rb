require 'rails_helper'

feature ' user visits ask question page and fills out form to ask question', %(
  As a user
  I want to post a question
  So that I can receive help from others
  ) do 

  #Acceptance Criteria
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly
    
  scenario 'user provides title that is at least 40 characters long' do

    visit '/questions/new'
    fill_in "Title", with: 'How do I makee a repository and push to github from the command line'
    fill_in "Body", with: "Lalalala. Create a new repository on GitHub. Open Terminal (for Mac users) or the command prompt (for Windows and Linux users). Change the current working directory to your local project. Initialize the local directory as a Git repository. Add the files in your new local repository"
    click_button "Add Question"

    expect(page).to have_content("Question added.")

  end

  scenario 'user does not fill in enough characters in title' do
      
    visit '/questions/new'
    fill_in "Title", with: 'How do I make github'
    fill_in "Body", with: "Lalalala. Create a new repository on GitHub. Open Terminal (for Mac users) or the command prompt (for Windows and Linux users). Change the current working directory to your local project. Initialize the local directory as a Git repository. Add the files in your new local repository"
    click_button "Add Question"

    expect(page).to have_content("Ask Your Question")
  end
  
  scenario 'user does not fill in enough characters in body' do
      
    visit '/questions/new'
    fill_in "Title", with: 'How do I make github because I want to be really cool like that'
    fill_in "Body", with: "Lalalala."

    expect(page).to have_content("Ask Your Question")
  end
end
