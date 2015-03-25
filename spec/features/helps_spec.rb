feature "Helps" do

  before(:each) do
    @stickywicket = Sticky.create(:title=> "blahblah", :content=>
      "blahblah blahblah", user_id: 1)
  end

  scenario "can be created through a button if loggen in" do

    page.set_rack_session(user_id: 1)
    visit sticky_path(@stickywicket)

    expect(page).to have_button("Help")

  end

  xscenario "can be created if logged in" do
    page.set_rack_session(user_id: 1)
    visit sticky_path(@stickywicket)
    click_button "Help"

    expect(page).to have_selector("form[method='post']")
    expect{
      fill_in 'Title', with: 'TEST TITLE!'
      fill_in 'Content', with: 'TEST CONTENT!!'
      page.execute_script("$('form[method='post']').submit()")

      # click_button 'Submit Help'
    }.to change{Help.count}.by(1)

  end

  scenario "can be updated" do
    @help = @stickywicket.helps.create(title: "Wrong Title", content: "Wrong Content", user_id:1)

    visit edit_sticky_help_path(@stickywicket, @help)

    fill_in "Title", with: "Updated Title"
    fill_in "Content", with: "Updated Content"
    click_button 'Update Help'
    @help.reload

    # expect(page).to have_content('Updated')
    expect(@help.title).to eq('Updated Title')
    expect(@help.content).to eq('Updated Content')
  end

end