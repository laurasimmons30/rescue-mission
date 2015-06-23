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
    question = Question.create(title: 'How do I make a repository and push to github from the command line', body: "Lalalala. Create a new repository on GitHub. Open Terminal (for Mac users) or the command prompt (for Windows and Linux users). Change the current working directory to your local project. Initialize the local directory as a Git repository. Add the files in your new local repository")
    
    visit '/questions'
    expect(page).to have_content(question.title)
  end
end
